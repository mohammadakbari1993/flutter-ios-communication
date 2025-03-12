//
//  SampleChannels.swift
//  Runner
//
//  Created by Mohammad Akbari on 3/11/25.
//

import Foundation
import Flutter

/// Manages Flutter method channels in a structured way.
extension Channels {
    
    enum SampleChannels: String, CaseIterable, Channelable {
        
        case data_channel = "com.example.data_channel"
        case status_channel = "com.example.status_channel"
        
        
        /// Lazily stores channels to prevent redundant creation.
        private static var channelCache: [SampleChannels: FlutterMethodChannel] = [:]
        
        /// Retrieves a Flutter method channel, using lazy initialization.
        func getChannel(controller: FlutterViewController) -> FlutterMethodChannel {
            if let cachedChannel = SampleChannels.channelCache[self] {
                return cachedChannel
            }
            
            let channel = FlutterMethodChannel(name: self.rawValue, binaryMessenger: controller.binaryMessenger)
            SampleChannels.channelCache[self] = channel
            return channel
        }
        
        /// Lazily initializes modules to avoid redundant instances.
        private static var moduleCache: [SampleChannels: CommunicationModule] = [:]
        
        /// Returns the corresponding communication module for the channel.
        var module: CommunicationModule {
            if let cachedModule = SampleChannels.moduleCache[self] {
                return cachedModule
            }
            
            let createdModule: CommunicationModule
            switch self {
            case .data_channel:
                createdModule = DataModule()
            case .status_channel:
                createdModule = StatusModule()
            }
            
            SampleChannels.moduleCache[self] = createdModule
            return createdModule
       
        }
        
    }
    
}
