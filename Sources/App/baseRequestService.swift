//
//  BaseRequestService.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 26/12/2023.
//  Copyright © 2023 Vulcan Labs. All rights reserved.
//

import Foundation
struct BaseRequestService {
    static let share = BaseRequestService()
    
    func requestApiWeather() -> [DayWeather]{
        var daysWeather: [DayWeather] = []
        if false{
          
            
        }else{
            let demoJsonDummy: DemoJsonDummy = DemoJsonDummy()
            let json: String = demoJsonDummy.getDummyContryWeather()
            do {
                let jsonData = json.data(using: .utf8)!
                let weatherResponse = try! JSONDecoder().decode(ContryWeather.self, from: jsonData)
                
                
                
                let group = Dictionary(grouping: weatherResponse.list , by: { $0.getDate() })
              
                for (key, weathers) in group {
                    let dayWeather = DayWeather(contry: weatherResponse.city.country, weatherData: weathers )
                    daysWeather.append(dayWeather)
                }
                return daysWeather
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
    }
    func requestApiContry() -> [Contry]{
        
        if false{
          
            
        }else{
            let demoJsonDummy: DemoJsonDummy = DemoJsonDummy()
            let json: String = demoJsonDummy.getDummyJsonContry()
            do {
                let jsonData = json.data(using: .utf8)!
                let contryResponse = try! JSONDecoder().decode([Contry].self, from: jsonData)
                
                
               return contryResponse
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        
        
    }
    
    
   
}
