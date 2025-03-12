//
//  DataPacket.swift
//  Runner
//
//  Created by Mohammad Akbari on 3/11/25.
//
import Foundation

struct DataPacket {
    let id: Int
    let value: String
    let timestamp: String
    
    /// Converts DataPacket to a dictionary for Flutter.
    func toDictionary() -> [String: Any] {
        return ["id": id, "value": value, "timestamp": timestamp]
    }
}
