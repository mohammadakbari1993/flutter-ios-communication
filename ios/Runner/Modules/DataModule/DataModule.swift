//
//  DataModule.swift
//  Runner
//
//  Created by Mohammad Akbari on 3/11/25.
//
import Foundation
import Flutter

/// Handles data-related method calls from Flutter.
class DataModule: CommunicationModule {
    
    /// Processes method calls related to data.
    /// - Parameters:
    ///   - call: The method call received from Flutter.
    ///   - result: The callback to return results back to Flutter.
    func handle(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getDataPacket" {
            do {
                let dataPacket = try generateDataPacket()
                print("✅ DataModule: Successfully generated data packet: \(dataPacket)")
                result(dataPacket.toDictionary())
            } catch {
                print("❌ DataModule Error: \(error.localizedDescription)")
                result(FlutterError(code: "DATA_ERROR", message: "Failed to generate data packet", details: error.localizedDescription))
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
    
    /// Generates a random data packet.
    /// - Throws: `DataModuleError.generationFailed` if generation fails.
    /// - Returns: A `DataPacket` object.
    private func generateDataPacket() throws -> DataPacket {
        let randomID = Int.random(in: 1000...9999)
        let randomValue = "Sample Data \(Int.random(in: 1...100))"
        let timestamp = ISO8601DateFormatter().string(from: Date())

        // Simulate a failure in 10% of cases
        if Int.random(in: 1...10) == 1 {
            throw DataModuleError.generationFailed
        }

        return DataPacket(id: randomID, value: randomValue, timestamp: timestamp)
    }
}


/// Custom error type for data generation failures.
enum DataModuleError: Error {
    case generationFailed
    
    var localizedDescription: String {
        switch self {
        case .generationFailed:
            return "Failed to generate data packet."
        }
    }
}
