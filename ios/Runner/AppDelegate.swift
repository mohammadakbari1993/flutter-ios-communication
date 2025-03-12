import Flutter
import UIKit


@main
@objc class AppDelegate: FlutterAppDelegate {
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        self.registerChannels()
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func registerChannels() {
        
        if let controller = window?.rootViewController as? FlutterViewController {
            
            Channels.SampleChannels.allCases.forEach { channel in
               
                CommunicationManager.shared.registerModule(channelName: channel.rawValue,
                                                           module: channel.module)
               
                channel.getChannel(controller: controller).setMethodCallHandler { (call, result) in
                    
                    CommunicationManager.shared.handleMethodCall(channelName: channel.rawValue,
                                                                 call: call,
                                                                 result: result)
                    
                }
                
            }
        }
    }
    

}
