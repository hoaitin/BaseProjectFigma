//
//  NetworkConstants.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 26/12/2023.
//  Copyright © 2023 Vulcan Labs. All rights reserved.
//

import Foundation

class NetworkConstants{
    public static var shared: NetworkConstants = NetworkConstants()
       
       public var apiKey: String {
           get {
              
               return "27df70e7700c7e94fd84a358cfa563d4"	
           }
       }
       
       public var serverAddress: String {
           get {
               return "api.openweathermap.org/data/2.5/forecast"
           }
       }
}
