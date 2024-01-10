import Foundation
import AVFAudio
import UIKit
import Firebase
import CoreLocation

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var rootViewController: UIViewController? {
        return window?.rootViewController
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // MARK: Initialize views
        self.window = UIWindow(frame: UIScreen.main.bounds)
      
      
        let nav = UINavigationController(rootViewController: MainViewController())
        nav.setNavigationBarHidden(true, animated: false)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        // update
        //
       
        
        // MARK: Prevent app's screen lock
        UIApplication.shared.isIdleTimerDisabled = true
        
        return true
    }
    
    func setLocation(){
        var locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
        
        var currentLocation: CLLocation!

        if
           CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
           CLLocationManager.authorizationStatus() ==  .authorizedAlways
        {
            currentLocation = locManager.location
            print("======\(currentLocation.coordinate.longitude)")
            print("\(currentLocation.coordinate.latitude)")
        }
        
        
    }
}
