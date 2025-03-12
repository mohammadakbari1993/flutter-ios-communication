//
//  Channels.swift
//  Runner
//
//  Created by Mohammad Akbari on 3/11/25.
//

import Foundation
import Flutter

protocol Channelable {
    func getChannel(controller : FlutterViewController) -> FlutterMethodChannel
    var module : CommunicationModule { get }
}

enum Channels {}
