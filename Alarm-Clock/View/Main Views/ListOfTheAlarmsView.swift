//
//  ListOfTheAlarmsView.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import SwiftUI

struct ListOfTheAlarmsView: View {
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    @State var isActive = false
    @State var currentIndex: Int? = nil
    @State var addEditViewType: AddEditViewType = .standard
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(lnManager.alarmViewModels.indices, id: \.self) { i in
                            AlarmRowViewButton(
                                model: lnManager.alarmViewModels[i],
                                i: i,
                                currentIndex: $currentIndex,
                                isActive: $isActive
                            )
                            .padding(.vertical)
                        }
                        .onDelete(perform: deleteMe)
                    }
                    SelectView(
                        width: 50,
                        addEditViewType: $addEditViewType,
                        isActive: $isActive
                    )
                }
                
                FourCoolCircles()
                    .opacity(0.3)
                
            }
            .navigationTitle("Alarm List")
            .sheet(
                isPresented: $isActive,
                onDismiss: {}
            ) {
                ChooseAlarmView(currentAlarmIndex: $currentIndex, addEditViewType: addEditViewType)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        isActive.toggle()
                    } label: {
                        Text("+")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(alarmBlack)
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }
    
    func deleteMe(offsets: IndexSet) {
        for index in offsets {
            print("Remove request from \(lnManager.alarmViewModels[index].id)")
            lnManager.removeRequest(id: lnManager.alarmViewModels[index].id)
        }
        
        lnManager.alarmViewModels.remove(atOffsets: offsets)
    }
}

#Preview {
    ListOfTheAlarmsView()
        .environmentObject(LocalNotificationManager())
}
