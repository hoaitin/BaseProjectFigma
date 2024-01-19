//
//  AnalyticsManager.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 18/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation
import FirebaseAnalytics

class AnalyticsManager{
    public static let share: AnalyticsManager = AnalyticsManager()
    
    func logEvent(name: String, parameters: [String: Any]? = nil){
        Analytics.logEvent(name, parameters: parameters)
    }
    
    func setUserID(userID: String){
        Analytics.setUserID(userID)
    }
    
    func setUserProperty(value: String?, property: String){
        Analytics.setUserProperty(value, forName: property)
    }
}
