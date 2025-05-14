//
//  String.swift
//  Alarm-Clock
//
//  Created by Ronjie Diafante Man-on on 5/14/25.
//

import Foundation

extension String {
    var formatSoundName: String {
        var result = String(describing: self)
            .replacingOccurrences(of: "_", with: " ")
            .capitalized
        
        let periodIndex = result.firstIndex(of: ".")
        
        if let periodIndex: Index = periodIndex {
            result.removeSubrange(periodIndex...)
        }
        
        return result
    }
}
