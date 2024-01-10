//
//  ContryWeather.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 26/12/2023.
//  Copyright © 2023 Vulcan Labs. All rights reserved.
//

import Foundation
struct Main:Codable {
    var temp: Double
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.temp = try container.decode(Double.self, forKey: .temp)
    }
   
}

struct Weather:Codable{
    var main: String
    var description: String
    var icon: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.main = try container.decode(String.self, forKey: .main)
        self.description = try container.decode(String.self, forKey: .description)
        self.icon = try container.decode(String.self, forKey: .icon)
    }
    
}

struct City:Codable{
    var country: String
    var timezone: Int
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.country = try container.decode(String.self, forKey: .country)
        self.timezone = try container.decode(Int.self, forKey: .timezone)
    }
    
}

struct WeatherData:Codable{
    var dt: Int
    var main: Main
    var weather: [Weather]
    var dt_txt: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dt = try container.decode(Int.self, forKey: .dt)
        self.main = try container.decode(Main.self, forKey: .main)
        self.weather = try container.decode([Weather].self, forKey: .weather)
        self.dt_txt = try container.decode(String.self, forKey: .dt_txt)
    }
    
    func getDate() -> String {
        let timestamp = TimeInterval(self.dt)
        let date = Date(timeIntervalSince1970: timestamp)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // Include time components
        let timeZone = TimeZone(identifier: "GMT")
        dateFormatter.timeZone = timeZone
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    func getTime() -> String {
        let timestamp = TimeInterval(self.dt)
        let date = Date(timeIntervalSince1970: timestamp)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:mm a"
        let timeZone = TimeZone(identifier: "GMT")
        dateFormatter.timeZone = timeZone
        
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }

    func getTemperatureF() -> String {
        return ConvertUilt.shared.ConvertTemperatureF(temp: self.main.temp)
        
    }
    
    func getTemperatureC() -> String {
        return ConvertUilt.shared.ConvertTemperatureC(temp: self.main.temp)
        
    }

}

struct ContryWeather:Codable{
    var cod: String
    var message: Int
    var list : [WeatherData]
    var city: City
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cod = try container.decode(String.self, forKey: .cod)
        self.message = try container.decode(Int.self, forKey: .message)
        self.list = try container.decode([WeatherData].self, forKey: .list)
        self.city = try container.decode(City.self, forKey: .city)
    }
  
}
