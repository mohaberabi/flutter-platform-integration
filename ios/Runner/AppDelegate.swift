import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate , NamesStorage {
    private let userDefaults = UserDefaults.standard

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
      LocalStorageApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: self)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
    
    func addName(id: String) {

        userDefaults.set(id, forKey: id)
        
        
       }
       
       func getName(id: String) {
  
           return userDefaults.string(forKey: id)
    
       }
       
       func getNames() -> [String] {
           if let faves = userDefaults.array(forKey: "names") as? [String] {
                 return names
             }
             return []
       }
       
  
  
}
