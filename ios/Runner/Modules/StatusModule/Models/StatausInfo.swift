//
//  StatausInfo.swift
//  Runner
//
//  Created by Mohammad Akbari on 3/11/25.
//

import Foundation

/// Represents the system status information.
struct StatusInfo {
    let status: String
    let uptime: String
    
    /// Converts `StatusInfo` to a dictionary for Flutter.
    func toDictionary() -> [String: Any] {
        return ["status": status, "uptime": uptime]
    }
}
