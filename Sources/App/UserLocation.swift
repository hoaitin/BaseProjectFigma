//
//  UserLocation.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 25/12/2023.
//  Copyright © 2023 Vulcan Labs. All rights reserved.
//

import Foundation
import CoreLocation
class UserLocation:NSObject, CLLocationManagerDelegate{
    private let locationManager = CLLocationManager()
    static let shared = UserLocation()
   
    private override init() {
        super.init()
    }
    
    func setupLocationManager() {
           locationManager.delegate = self
           locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
           locationManager.requestWhenInUseAuthorization()
           locationManager.startUpdatingLocation()
   }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.last {
                // Xử lý thông tin vị trí mới
               let  latitude = location.coordinate.latitude
                let  longitude = location.coordinate.longitude
                print("Latitude: \(latitude), Longitude: \(longitude)")
            }
        }

        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            // Xử lý lỗi khi không thể lấy được vị trí
            print("Error: \(error.localizedDescription)")
        }
    
    
}
