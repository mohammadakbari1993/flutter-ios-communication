//
//  CommunicationManager.swift
//  Runner
//
//  Created by Mohammad Akbari on 3/11/25.
//

import Flutter
import Foundation

protocol CommunicationModule {
    func handle(call: FlutterMethodCall, result : @escaping FlutterResult)
}

class CommunicationManager {
    
    static let shared = CommunicationManager()
    
    /// Dictionary holding registered communication modules.
    private var modules: [String: CommunicationModule] = [:]
    
    
    /// Registers a communication module for a given channel.
    /// - Parameters:
    ///   - channelName: The unique name of the channel.
    ///   - module: The module to register.
    func registerModule(channelName : String, module : CommunicationModule) {
        modules[channelName] = module
    }
    
    /// Handles method calls from Flutter and routes them to the correct module.
    /// - Parameters:
    ///   - channelName: The method channel name.
    ///   - call: The method call received from Flutter.
    ///   - result: The result callback to return the response.
    func handleMethodCall(channelName: String, call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let module = modules[channelName] {
            module.handle(call: call, result: result)
        } else {
            result(FlutterError(code: "ModuleNotFound", message: "No module found for channel: \(channelName)", details: nil))
        }
    }
    
    
}
