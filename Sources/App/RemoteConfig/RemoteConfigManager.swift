//
//  RemoteConfigManager.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 19/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation
import FirebaseRemoteConfig
class RemoteConfigManager{
    public static let share:RemoteConfigManager = RemoteConfigManager()
    let settings = RemoteConfigSettings()
    var remoteConfig = RemoteConfig.remoteConfig()
    
    func fetchRemoteConfigValues(key: String, completion: @escaping callback){
        settings.minimumFetchInterval = 120
        remoteConfig.configSettings = settings
      
        remoteConfig.setDefaults(ConfigValueDeffault.defaultValues)
        
        remoteConfig.fetch(withExpirationDuration: 120, completionHandler: { status, error in
            if status == .success, error == nil{
                self.remoteConfig.activate(completion: {change,error in
                    guard error == nil else{
                        completion(false,nil,"Error")
                        return
                    }
                    let value = self.remoteConfig.configValue(forKey: key).stringValue
                    completion(true,value,"success")
                    
                })
                
            }else{
                completion(false,nil,"Error fetching remote config")
            }
        })

 
    }
}
