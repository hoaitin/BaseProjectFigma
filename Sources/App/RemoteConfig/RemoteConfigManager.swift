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
    private let userDefault = UserDefaults.standard
    
//    let settings = RemoteConfigSettings()
    
    let remoteConfig: RemoteConfig = {
        let rc = RemoteConfig.remoteConfig()
         let settings = RemoteConfigSettings()
         settings.minimumFetchInterval = 0
         rc.configSettings = settings
         return rc
     }()
    
    init() {
        fetchRc()
    }
    
    func fetchRc() {
        let time = TimeInterval(0)
        remoteConfig.fetch(withExpirationDuration: time) { (status, error) in
            guard error == nil else { return }
            self.remoteConfig.activate { change,error in
                guard error == nil else { return }
                self.getData()
            }
        }
    }
    
    func getData() {
        do {
            let value = self.remoteConfig.configValue(forKey: "onboarding").stringValue
            self.userDefault.setValue(value, forKey: "onboarding")
            print("RC 1: \(value)")
            
            let categoriesRC = self.remoteConfig.configValue(forKey: "categories").dataValue
            self.userDefault.set(categoriesRC,forKey: "categories")
            print("RC 2: \(categoriesRC)")
            
            self.userDefault.set(true, forKey: "loadData")
            
        } catch {
            print("RC Get wrong!")
        }
    }
    
//    func fetchRemoteConfigValues(key: String, completion: @escaping callback){
//        let list:[RemoteConfigParameter] = [
//            RemoteConfigParameter(key: ConfigKey.set_text_view_splash, type: "String"),
//            RemoteConfigParameter(key: ConfigKey.set_text_view_OB1, type: "String"),
//            RemoteConfigParameter(key: ConfigKey.set_text_view_OB2, type: "String"),
//            RemoteConfigParameter(key: ConfigKey.categories, type: "Json")
//        ]
//        
//        DispatchQueue.global().async {
//            self.remoteConfig.fetch(withExpirationDuration: 0, completionHandler: { status, error in
//                if status == .success, error == nil{
//                    self.remoteConfig.activate(completion: {change,error in
//                        guard error == nil else{
//                            completion(false,nil,"Error")
//                            return
//                        }
//                        
//                        for item in list {
//                            switch item.type {
//                            case "String":
//                                let value = self.remoteConfig.configValue(forKey: key).stringValue
//                                UserDefaults.standard.set(value, forKey: item.key)
//                                
//                            case "Json":
//                                let jsonValue = self.remoteConfig.configValue(forKey: key).jsonValue
//                                // Tiếp tục xử lý JSON
//                                if let jsonData = try? JSONSerialization.data(withJSONObject: jsonValue) {
//                                    do {
//                                       
//                                        let decoder = JSONDecoder()
//                                        let categories = try decoder.decode([CategoryItem].self, from: jsonData)
//                                        completion(true, categories, "success")
//                                    } catch {
//                                        print("Error decoding JSON: \(error)")
//                                        completion(false, nil, "Error decoding JSON")
//                                    }
//                                } else {
//                                    completion(false, nil, "Error: Unable to get JSON data from Remote Config")
//                                }
//                            
//                                
//                            default: break
//                                
//                            }
//                        }
//
//                        completion(true,value,"success")
//                        
//                    })
//                    
//                }else{
//                    print("==== LOAD RC FAILED")
//                    completion(false,nil,"Error fetching remote config")
//                }
//            })
//        }
//    }
    
    func fetchRemoteConfigCategories(key: String, completion: @escaping callback) {
        DispatchQueue.global().async {
            self.remoteConfig.fetch(withExpirationDuration: 120) { status, error in
                if status == .success, error == nil {
                    self.remoteConfig.activate { change, error in
                        guard error == nil else {
                            completion(false, nil, "Error")
                            return
                        }

                        // Thực hiện lấy giá trị từ Remote Config sau khi đã activate
                        let jsonValue = self.remoteConfig.configValue(forKey: key).jsonValue
                        // Tiếp tục xử lý JSON
                        if let jsonData = try? JSONSerialization.data(withJSONObject: jsonValue) {
                            do {
                                let decoder = JSONDecoder()
                                let categories = try decoder.decode([CategoryItem].self, from: jsonData)
                                completion(true, categories, "success")
                            } catch {
                                print("Error decoding JSON: \(error)")
                                completion(false, nil, "Error decoding JSON")
                            }
                        } else {
                            completion(false, nil, "Error: Unable to get JSON data from Remote Config")
                        }
                    }
                } else {
                    completion(false, nil, "Error fetching remote config")
                }
            }
        }
    }


}
