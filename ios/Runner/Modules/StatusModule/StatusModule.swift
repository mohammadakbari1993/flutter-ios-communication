//
//  StatusModule.swift
//  Runner
//
//  Created by Mohammad Akbari on 3/11/25.
//

import Foundation
import Flutter
/// Handles status-related method calls from Flutter.
class StatusModule: CommunicationModule {
    
    /// Processes method calls related to system status.
    /// - Parameters:
    ///   - call: The method call received from Flutter.
    ///   - result: The callback to return results back to Flutter.
    func handle(call: FlutterMethodCall, result: @escaping FlutterResult) {
        print("📡 StatusModule: Received method call: \(call.method)")
        if call.method == "getStatus" {
            do {
                let statusInfo = try getStatusInfo()
                print("✅ StatusModule: Returning status info: \(statusInfo)")
                result(statusInfo.toDictionary())
            } catch {
                print("❌ StatusModule Error: \(error.localizedDescription)")
                result(FlutterError(code: "STATUS_ERROR", message: "Failed to retrieve status", details: error.localizedDescription))
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
    
    /// Generates system status information.
    /// - Throws: An error if status retrieval fails.
    /// - Returns: A `StatusInfo` object.
    private func getStatusInfo() throws -> StatusInfo {
        let status = "Connected"
        let uptime = "\(Int.random(in: 1...100)) minutes"
        
        // Simulate a failure in 5% of cases
        if Int.random(in: 1...20) == 1 {
            throw NSError(domain: "com.example.status", code: 500, userInfo: [NSLocalizedDescriptionKey: "Simulated status retrieval failure"])
        }
        
        return StatusInfo(status: status, uptime: uptime)
    }
    
}
