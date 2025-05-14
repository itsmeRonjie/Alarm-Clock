//
//  LocalNotificationManager.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import Foundation
import NotificationCenter

@MainActor
class LocalNotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current()
    @Published var isAuthorized = false
    
    @Published var pendingAlarms: [UNNotificationRequest] = []
    
    @Published var alarmViewModels: [AlarmModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemKey = "Alarm List"
    
    func requestAuthorization() async throws {
        try await notificationCenter
            .requestAuthorization(
                options: [.sound, .badge, .alert]
            )
        
        await getCurrentSettings()
    }
    
    func getCurrentSettings() async {
        let currentSettings = await notificationCenter.notificationSettings()
        
        isAuthorized = currentSettings.authorizationStatus == .authorized
    }
    
    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                Task {
                    await UIApplication.shared.open(url)
                }
            }
        }
    }
    
    func saveItems() {
        if let encodeData = try? JSONEncoder()
            .encode(alarmViewModels) {
            UserDefaults
                .standard
                .set(encodeData, forKey: itemKey)
        }
    }
    
    override init() {
        super.init()
        
        notificationCenter.delegate = self
        
        guard let data = UserDefaults
            .standard
            .data(forKey: itemKey),
              let savedItems = try? JSONDecoder()
            .decode([AlarmModel].self, from: data)
        else {
            return
        }
        self.alarmViewModels = savedItems
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        
        let notificationId = notification.request.identifier
        
        if let index = alarmViewModels.firstIndex(
            where: { $0.id == notificationId }
        ) {
            alarmViewModels[index].alarmEnabled = false
        }
        
        pendingAlarms = await notificationCenter.pendingNotificationRequests()
        
        return [.sound, .banner]
    }
    
    func getPendingAlarms() async {
        pendingAlarms = await notificationCenter.pendingNotificationRequests()
    }
    
    func schedule( localNotification: AlarmModel) async {
        let content = UNMutableNotificationContent()
        content.body = NSLocalizedString(localNotification.body, comment: "")
        
        content.sound = customSound(soundName: localNotification.sound)
        
        let dateComponents = localNotification.endDateComponents
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: localNotification.repeats)
        
        let request = UNNotificationRequest(
            identifier: localNotification.id,
            content: content,
            trigger: trigger)
        
        try? await notificationCenter.add(request)
        
        pendingAlarms = await notificationCenter
            .pendingNotificationRequests()
    }
    
    func customSound( soundName: Sounds, fileExtension: String = "") -> UNNotificationSound? {
        let period = fileExtension.isEmpty ? "" : "."
        let filename = "\(soundName.rawValue)\(period)\(fileExtension)"
        
        return UNNotificationSound(
            named: UNNotificationSoundName(rawValue: filename)
        )
    }
    
    func removeRequest(id: String) {
        notificationCenter.removeDeliveredNotifications(withIdentifiers: [id])
        
        if let index = pendingAlarms.firstIndex(where: {$0.identifier == id})
        {
            pendingAlarms.remove(at: index)
        }
    }
    
    func safeAppend(localNotification: AlarmModel) {
        if let index = alarmViewModels
            .firstIndex(where: {$0.id == localNotification.id }) {
            print("Alarm already exists so do not append...")
            print("Update the alarm")
            
            alarmViewModels[index] = localNotification
        } else {
            alarmViewModels.append(localNotification)
        }
        
        alarmViewModels = alarmViewModels
            .sorted(
                by: { $0.endTime < $1.endTime }
            )
    }
}
