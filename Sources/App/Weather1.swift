//
//  Weather.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 22/12/2023.
//  Copyright © 2023 Vulcan Labs. All rights reserved.
//

import Foundation
struct Weather1 {
     var dayOnWeather: String
     var imageWeather: String
     var temperature: String
    init(dayOnWeather: String, imageWeather: String, temperature: String) {
        self.dayOnWeather = dayOnWeather
        self.imageWeather = imageWeather
        self.temperature = temperature
    }
}
