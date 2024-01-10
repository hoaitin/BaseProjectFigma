//
//  DemoJsonDummy.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 26/12/2023.
//  Copyright © 2023 Vulcan Labs. All rights reserved.
//

import Foundation



class DemoJsonDummy{
    
    
    
public func getDummyContryWeather() ->String {
        let jsonString = """
        {
            "cod": "200",
            "city": {
                "country": "JP"
            },
            "list": [
                 {
                           "dt": 1703646000,
                           "main": {
                               "temp": 284.61,
                               "feels_like": 282.88,
                               "temp_min": 283.54,
                               "temp_max": 284.61,
                               "pressure": 1026,
                               "sea_level": 1026,
                               "grnd_level": 1024,
                               "humidity": 41,
                               "temp_kf": 1.07
                           },
                           "weather": [
                               {
                                   "id": 803,
                                   "main": "Clouds",
                                   "description": "broken clouds",
                                   "icon": "04d"
                               }
                           ],
                           "clouds": {
                               "all": 75
                           },
                           "wind": {
                               "speed": 3.47,
                               "deg": 350,
                               "gust": 4.39
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "d"
                           },
                           "dt_txt": "2023-12-27 03:00:00"
                       },
                       {
                           "dt": 1703656800,
                           "main": {
                               "temp": 284.67,
                               "feels_like": 282.9,
                               "temp_min": 284.67,
                               "temp_max": 284.79,
                               "pressure": 1026,
                               "sea_level": 1026,
                               "grnd_level": 1024,
                               "humidity": 39,
                               "temp_kf": -0.12
                           },
                           "weather": [
                               {
                                   "id": 803,
                                   "main": "Clouds",
                                   "description": "broken clouds",
                                   "icon": "04d"
                               }
                           ],
                           "clouds": {
                               "all": 73
                           },
                           "wind": {
                               "speed": 2.32,
                               "deg": 331,
                               "gust": 2.75
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "d"
                           },
                           "dt_txt": "2023-12-27 06:00:00"
                       },
                       {
                           "dt": 1703667600,
                           "main": {
                               "temp": 284.44,
                               "feels_like": 282.64,
                               "temp_min": 284.35,
                               "temp_max": 284.44,
                               "pressure": 1027,
                               "sea_level": 1027,
                               "grnd_level": 1026,
                               "humidity": 39,
                               "temp_kf": 0.09
                           },
                           "weather": [
                               {
                                   "id": 803,
                                   "main": "Clouds",
                                   "description": "broken clouds",
                                   "icon": "04n"
                               }
                           ],
                           "clouds": {
                               "all": 76
                           },
                           "wind": {
                               "speed": 1.71,
                               "deg": 353,
                               "gust": 2.2
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-27 09:00:00"
                       },
                       {
                           "dt": 1703678400,
                           "main": {
                               "temp": 282.35,
                               "feels_like": 279.87,
                               "temp_min": 282.35,
                               "temp_max": 282.35,
                               "pressure": 1028,
                               "sea_level": 1028,
                               "grnd_level": 1026,
                               "humidity": 37,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 804,
                                   "main": "Clouds",
                                   "description": "overcast clouds",
                                   "icon": "04n"
                               }
                           ],
                           "clouds": {
                               "all": 85
                           },
                           "wind": {
                               "speed": 4.68,
                               "deg": 348,
                               "gust": 5.83
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-27 12:00:00"
                       },
                       {
                           "dt": 1703689200,
                           "main": {
                               "temp": 281.49,
                               "feels_like": 278.94,
                               "temp_min": 281.49,
                               "temp_max": 281.49,
                               "pressure": 1028,
                               "sea_level": 1028,
                               "grnd_level": 1026,
                               "humidity": 42,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 804,
                                   "main": "Clouds",
                                   "description": "overcast clouds",
                                   "icon": "04n"
                               }
                           ],
                           "clouds": {
                               "all": 100
                           },
                           "wind": {
                               "speed": 4.36,
                               "deg": 346,
                               "gust": 4.61
                           },
                           "visibility": 10000,
                           "pop": 0.02,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-27 15:00:00"
                       },
                       {
                           "dt": 1703700000,
                           "main": {
                               "temp": 280.78,
                               "feels_like": 278.26,
                               "temp_min": 280.78,
                               "temp_max": 280.78,
                               "pressure": 1028,
                               "sea_level": 1028,
                               "grnd_level": 1026,
                               "humidity": 46,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 804,
                                   "main": "Clouds",
                                   "description": "overcast clouds",
                                   "icon": "04n"
                               }
                           ],
                           "clouds": {
                               "all": 100
                           },
                           "wind": {
                               "speed": 3.97,
                               "deg": 7,
                               "gust": 4.14
                           },
                           "visibility": 10000,
                           "pop": 0.02,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-27 18:00:00"
                       },
                       {
                           "dt": 1703710800,
                           "main": {
                               "temp": 280.46,
                               "feels_like": 278.25,
                               "temp_min": 280.46,
                               "temp_max": 280.46,
                               "pressure": 1028,
                               "sea_level": 1028,
                               "grnd_level": 1026,
                               "humidity": 54,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 804,
                                   "main": "Clouds",
                                   "description": "overcast clouds",
                                   "icon": "04n"
                               }
                           ],
                           "clouds": {
                               "all": 100
                           },
                           "wind": {
                               "speed": 3.29,
                               "deg": 10,
                               "gust": 3.42
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-27 21:00:00"
                       },
                       {
                           "dt": 1703721600,
                           "main": {
                               "temp": 280.51,
                               "feels_like": 278.08,
                               "temp_min": 280.51,
                               "temp_max": 280.51,
                               "pressure": 1028,
                               "sea_level": 1028,
                               "grnd_level": 1026,
                               "humidity": 54,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 804,
                                   "main": "Clouds",
                                   "description": "overcast clouds",
                                   "icon": "04d"
                               }
                           ],
                           "clouds": {
                               "all": 100
                           },
                           "wind": {
                               "speed": 3.68,
                               "deg": 3,
                               "gust": 3.77
                           },
                           "visibility": 10000,
                           "pop": 0.01,
                           "sys": {
                               "pod": "d"
                           },
                           "dt_txt": "2023-12-28 00:00:00"
                       },
                       {
                           "dt": 1703732400,
                           "main": {
                               "temp": 280.28,
                               "feels_like": 277.58,
                               "temp_min": 280.28,
                               "temp_max": 280.28,
                               "pressure": 1025,
                               "sea_level": 1025,
                               "grnd_level": 1023,
                               "humidity": 60,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 500,
                                   "main": "Rain",
                                   "description": "light rain",
                                   "icon": "10d"
                               }
                           ],
                           "clouds": {
                               "all": 100
                           },
                           "wind": {
                               "speed": 4.08,
                               "deg": 3,
                               "gust": 4.3
                           },
                           "visibility": 10000,
                           "pop": 0.21,
                           "rain": {
                               "3h": 0.1
                           },
                           "sys": {
                               "pod": "d"
                           },
                           "dt_txt": "2023-12-28 03:00:00"
                       },
                       {
                           "dt": 1703743200,
                           "main": {
                               "temp": 280.96,
                               "feels_like": 278.61,
                               "temp_min": 280.96,
                               "temp_max": 280.96,
                               "pressure": 1023,
                               "sea_level": 1023,
                               "grnd_level": 1021,
                               "humidity": 63,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 804,
                                   "main": "Clouds",
                                   "description": "overcast clouds",
                                   "icon": "04d"
                               }
                           ],
                           "clouds": {
                               "all": 99
                           },
                           "wind": {
                               "speed": 3.72,
                               "deg": 27,
                               "gust": 3.88
                           },
                           "visibility": 10000,
                           "pop": 0.01,
                           "sys": {
                               "pod": "d"
                           },
                           "dt_txt": "2023-12-28 06:00:00"
                       },
                       {
                           "dt": 1703754000,
                           "main": {
                               "temp": 281.06,
                               "feels_like": 280.11,
                               "temp_min": 281.06,
                               "temp_max": 281.06,
                               "pressure": 1023,
                               "sea_level": 1023,
                               "grnd_level": 1021,
                               "humidity": 67,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 802,
                                   "main": "Clouds",
                                   "description": "scattered clouds",
                                   "icon": "03n"
                               }
                           ],
                           "clouds": {
                               "all": 46
                           },
                           "wind": {
                               "speed": 1.79,
                               "deg": 34,
                               "gust": 2.21
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-28 09:00:00"
                       },
                       {
                           "dt": 1703764800,
                           "main": {
                               "temp": 281.13,
                               "feels_like": 280.08,
                               "temp_min": 281.13,
                               "temp_max": 281.13,
                               "pressure": 1022,
                               "sea_level": 1022,
                               "grnd_level": 1021,
                               "humidity": 67,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 803,
                                   "main": "Clouds",
                                   "description": "broken clouds",
                                   "icon": "04n"
                               }
                           ],
                           "clouds": {
                               "all": 60
                           },
                           "wind": {
                               "speed": 1.9,
                               "deg": 355,
                               "gust": 1.93
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-28 12:00:00"
                       },
                       {
                           "dt": 1703775600,
                           "main": {
                               "temp": 280.95,
                               "feels_like": 279.3,
                               "temp_min": 280.95,
                               "temp_max": 280.95,
                               "pressure": 1021,
                               "sea_level": 1021,
                               "grnd_level": 1019,
                               "humidity": 67,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 803,
                                   "main": "Clouds",
                                   "description": "broken clouds",
                                   "icon": "04n"
                               }
                           ],
                           "clouds": {
                               "all": 79
                           },
                           "wind": {
                               "speed": 2.59,
                               "deg": 340,
                               "gust": 2.76
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-28 15:00:00"
                       },
                       {
                           "dt": 1703786400,
                           "main": {
                               "temp": 280.16,
                               "feels_like": 278.19,
                               "temp_min": 280.16,
                               "temp_max": 280.16,
                               "pressure": 1020,
                               "sea_level": 1020,
                               "grnd_level": 1018,
                               "humidity": 62,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 803,
                                   "main": "Clouds",
                                   "description": "broken clouds",
                                   "icon": "04n"
                               }
                           ],
                           "clouds": {
                               "all": 62
                           },
                           "wind": {
                               "speed": 2.83,
                               "deg": 331,
                               "gust": 3.53
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-28 18:00:00"
                       },
                       {
                           "dt": 1703797200,
                           "main": {
                               "temp": 279.78,
                               "feels_like": 277.95,
                               "temp_min": 279.78,
                               "temp_max": 279.78,
                               "pressure": 1020,
                               "sea_level": 1020,
                               "grnd_level": 1018,
                               "humidity": 52,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 800,
                                   "main": "Clear",
                                   "description": "clear sky",
                                   "icon": "01n"
                               }
                           ],
                           "clouds": {
                               "all": 0
                           },
                           "wind": {
                               "speed": 2.54,
                               "deg": 347,
                               "gust": 3.99
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-28 21:00:00"
                       },
                       {
                           "dt": 1703808000,
                           "main": {
                               "temp": 281.34,
                               "feels_like": 279.16,
                               "temp_min": 281.34,
                               "temp_max": 281.34,
                               "pressure": 1021,
                               "sea_level": 1021,
                               "grnd_level": 1020,
                               "humidity": 43,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 800,
                                   "main": "Clear",
                                   "description": "clear sky",
                                   "icon": "01d"
                               }
                           ],
                           "clouds": {
                               "all": 0
                           },
                           "wind": {
                               "speed": 3.56,
                               "deg": 343,
                               "gust": 5.84
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "d"
                           },
                           "dt_txt": "2023-12-29 00:00:00"
                       },
                       {
                           "dt": 1703818800,
                           "main": {
                               "temp": 284.64,
                               "feels_like": 282.89,
                               "temp_min": 284.64,
                               "temp_max": 284.64,
                               "pressure": 1021,
                               "sea_level": 1021,
                               "grnd_level": 1019,
                               "humidity": 40,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 800,
                                   "main": "Clear",
                                   "description": "clear sky",
                                   "icon": "01d"
                               }
                           ],
                           "clouds": {
                               "all": 0
                           },
                           "wind": {
                               "speed": 4.03,
                               "deg": 357,
                               "gust": 5.06
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "d"
                           },
                           "dt_txt": "2023-12-29 03:00:00"
                       },
                       {
                           "dt": 1703829600,
                           "main": {
                               "temp": 285.89,
                               "feels_like": 284.19,
                               "temp_min": 285.89,
                               "temp_max": 285.89,
                               "pressure": 1021,
                               "sea_level": 1021,
                               "grnd_level": 1019,
                               "humidity": 37,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 800,
                                   "main": "Clear",
                                   "description": "clear sky",
                                   "icon": "01d"
                               }
                           ],
                           "clouds": {
                               "all": 0
                           },
                           "wind": {
                               "speed": 2.14,
                               "deg": 13,
                               "gust": 2.87
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "d"
                           },
                           "dt_txt": "2023-12-29 06:00:00"
                       },
                       {
                           "dt": 1703840400,
                           "main": {
                               "temp": 285.12,
                               "feels_like": 283.36,
                               "temp_min": 285.12,
                               "temp_max": 285.12,
                               "pressure": 1023,
                               "sea_level": 1023,
                               "grnd_level": 1021,
                               "humidity": 38,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 800,
                                   "main": "Clear",
                                   "description": "clear sky",
                                   "icon": "01n"
                               }
                           ],
                           "clouds": {
                               "all": 0
                           },
                           "wind": {
                               "speed": 0.13,
                               "deg": 127,
                               "gust": 0.38
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-29 09:00:00"
                       },
                       {
                           "dt": 1703851200,
                           "main": {
                               "temp": 284.05,
                               "feels_like": 282.32,
                               "temp_min": 284.05,
                               "temp_max": 284.05,
                               "pressure": 1023,
                               "sea_level": 1023,
                               "grnd_level": 1021,
                               "humidity": 43,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 800,
                                   "main": "Clear",
                                   "description": "clear sky",
                                   "icon": "01n"
                               }
                           ],
                           "clouds": {
                               "all": 0
                           },
                           "wind": {
                               "speed": 1.39,
                               "deg": 312,
                               "gust": 2.06
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-29 12:00:00"
                       },
                       {
                           "dt": 1703862000,
                           "main": {
                               "temp": 282.27,
                               "feels_like": 280.84,
                               "temp_min": 282.27,
                               "temp_max": 282.27,
                               "pressure": 1023,
                               "sea_level": 1023,
                               "grnd_level": 1022,
                               "humidity": 51,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 800,
                                   "main": "Clear",
                                   "description": "clear sky",
                                   "icon": "01n"
                               }
                           ],
                           "clouds": {
                               "all": 1
                           },
                           "wind": {
                               "speed": 2.63,
                               "deg": 333,
                               "gust": 3.94
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-29 15:00:00"
                       },
                       {
                           "dt": 1703872800,
                           "main": {
                               "temp": 281.75,
                               "feels_like": 279.66,
                               "temp_min": 281.75,
                               "temp_max": 281.75,
                               "pressure": 1023,
                               "sea_level": 1023,
                               "grnd_level": 1021,
                               "humidity": 55,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 802,
                                   "main": "Clouds",
                                   "description": "scattered clouds",
                                   "icon": "03n"
                               }
                           ],
                           "clouds": {
                               "all": 31
                           },
                           "wind": {
                               "speed": 3.56,
                               "deg": 346,
                               "gust": 4.83
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-29 18:00:00"
                       },
                       {
                           "dt": 1703883600,
                           "main": {
                               "temp": 281.17,
                               "feels_like": 279.12,
                               "temp_min": 281.17,
                               "temp_max": 281.17,
                               "pressure": 1024,
                               "sea_level": 1024,
                               "grnd_level": 1022,
                               "humidity": 58,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 804,
                                   "main": "Clouds",
                                   "description": "overcast clouds",
                                   "icon": "04n"
                               }
                           ],
                           "clouds": {
                               "all": 100
                           },
                           "wind": {
                               "speed": 3.26,
                               "deg": 357,
                               "gust": 4.43
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-29 21:00:00"
                       },
                       {
                           "dt": 1703894400,
                           "main": {
                               "temp": 281.86,
                               "feels_like": 279.79,
                               "temp_min": 281.86,
                               "temp_max": 281.86,
                               "pressure": 1024,
                               "sea_level": 1024,
                               "grnd_level": 1023,
                               "humidity": 53,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 804,
                                   "main": "Clouds",
                                   "description": "overcast clouds",
                                   "icon": "04d"
                               }
                           ],
                           "clouds": {
                               "all": 97
                           },
                           "wind": {
                               "speed": 3.56,
                               "deg": 356,
                               "gust": 4.16
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "d"
                           },
                           "dt_txt": "2023-12-30 00:00:00"
                       },
                       {
                           "dt": 1703905200,
                           "main": {
                               "temp": 283.87,
                               "feels_like": 282.22,
                               "temp_min": 283.87,
                               "temp_max": 283.87,
                               "pressure": 1023,
                               "sea_level": 1023,
                               "grnd_level": 1021,
                               "humidity": 47,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 803,
                                   "main": "Clouds",
                                   "description": "broken clouds",
                                   "icon": "04d"
                               }
                           ],
                           "clouds": {
                               "all": 71
                           },
                           "wind": {
                               "speed": 2.71,
                               "deg": 17,
                               "gust": 2.62
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "d"
                           },
                           "dt_txt": "2023-12-30 03:00:00"
                       },
                       {
                           "dt": 1703916000,
                           "main": {
                               "temp": 285.02,
                               "feels_like": 283.7,
                               "temp_min": 285.02,
                               "temp_max": 285.02,
                               "pressure": 1022,
                               "sea_level": 1022,
                               "grnd_level": 1020,
                               "humidity": 55,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 802,
                                   "main": "Clouds",
                                   "description": "scattered clouds",
                                   "icon": "03d"
                               }
                           ],
                           "clouds": {
                               "all": 44
                           },
                           "wind": {
                               "speed": 2.28,
                               "deg": 60,
                               "gust": 2.07
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "d"
                           },
                           "dt_txt": "2023-12-30 06:00:00"
                       },
                       {
                           "dt": 1703926800,
                           "main": {
                               "temp": 284.06,
                               "feels_like": 282.88,
                               "temp_min": 284.06,
                               "temp_max": 284.06,
                               "pressure": 1022,
                               "sea_level": 1022,
                               "grnd_level": 1020,
                               "humidity": 64,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 801,
                                   "main": "Clouds",
                                   "description": "few clouds",
                                   "icon": "02n"
                               }
                           ],
                           "clouds": {
                               "all": 11
                           },
                           "wind": {
                               "speed": 1.05,
                               "deg": 45,
                               "gust": 1.04
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-30 09:00:00"
                       },
                       {
                           "dt": 1703937600,
                           "main": {
                               "temp": 283.3,
                               "feels_like": 282.15,
                               "temp_min": 283.3,
                               "temp_max": 283.3,
                               "pressure": 1021,
                               "sea_level": 1021,
                               "grnd_level": 1019,
                               "humidity": 68,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 800,
                                   "main": "Clear",
                                   "description": "clear sky",
                                   "icon": "01n"
                               }
                           ],
                           "clouds": {
                               "all": 6
                           },
                           "wind": {
                               "speed": 1.08,
                               "deg": 323,
                               "gust": 1.21
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-30 12:00:00"
                       },
                       {
                           "dt": 1703948400,
                           "main": {
                               "temp": 282.9,
                               "feels_like": 282.3,
                               "temp_min": 282.9,
                               "temp_max": 282.9,
                               "pressure": 1020,
                               "sea_level": 1020,
                               "grnd_level": 1018,
                               "humidity": 65,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 802,
                                   "main": "Clouds",
                                   "description": "scattered clouds",
                                   "icon": "03n"
                               }
                           ],
                           "clouds": {
                               "all": 27
                           },
                           "wind": {
                               "speed": 1.72,
                               "deg": 238,
                               "gust": 2.08
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-30 15:00:00"
                       },
                       {
                           "dt": 1703959200,
                           "main": {
                               "temp": 282.64,
                               "feels_like": 282,
                               "temp_min": 282.64,
                               "temp_max": 282.64,
                               "pressure": 1017,
                               "sea_level": 1017,
                               "grnd_level": 1015,
                               "humidity": 62,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 803,
                                   "main": "Clouds",
                                   "description": "broken clouds",
                                   "icon": "04n"
                               }
                           ],
                           "clouds": {
                               "all": 63
                           },
                           "wind": {
                               "speed": 1.72,
                               "deg": 258,
                               "gust": 2.88
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-30 18:00:00"
                       },
                       {
                           "dt": 1703970000,
                           "main": {
                               "temp": 281.85,
                               "feels_like": 280.78,
                               "temp_min": 281.85,
                               "temp_max": 281.85,
                               "pressure": 1015,
                               "sea_level": 1015,
                               "grnd_level": 1013,
                               "humidity": 60,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 804,
                                   "main": "Clouds",
                                   "description": "overcast clouds",
                                   "icon": "04n"
                               }
                           ],
                           "clouds": {
                               "all": 100
                           },
                           "wind": {
                               "speed": 2.05,
                               "deg": 321,
                               "gust": 2.92
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-30 21:00:00"
                       },
                       {
                           "dt": 1703980800,
                           "main": {
                               "temp": 282.38,
                               "feels_like": 280.97,
                               "temp_min": 282.38,
                               "temp_max": 282.38,
                               "pressure": 1013,
                               "sea_level": 1013,
                               "grnd_level": 1011,
                               "humidity": 55,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 804,
                                   "main": "Clouds",
                                   "description": "overcast clouds",
                                   "icon": "04d"
                               }
                           ],
                           "clouds": {
                               "all": 97
                           },
                           "wind": {
                               "speed": 2.63,
                               "deg": 352,
                               "gust": 2.67
                           },
                           "visibility": 10000,
                           "pop": 0.04,
                           "sys": {
                               "pod": "d"
                           },
                           "dt_txt": "2023-12-31 00:00:00"
                       },
                       {
                           "dt": 1703991600,
                           "main": {
                               "temp": 280.81,
                               "feels_like": 278.77,
                               "temp_min": 280.81,
                               "temp_max": 280.81,
                               "pressure": 1008,
                               "sea_level": 1008,
                               "grnd_level": 1006,
                               "humidity": 70,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 500,
                                   "main": "Rain",
                                   "description": "light rain",
                                   "icon": "10d"
                               }
                           ],
                           "clouds": {
                               "all": 100
                           },
                           "wind": {
                               "speed": 3.13,
                               "deg": 332,
                               "gust": 3.29
                           },
                           "visibility": 10000,
                           "pop": 0.87,
                           "rain": {
                               "3h": 1.31
                           },
                           "sys": {
                               "pod": "d"
                           },
                           "dt_txt": "2023-12-31 03:00:00"
                       },
                       {
                           "dt": 1704002400,
                           "main": {
                               "temp": 280.74,
                               "feels_like": 277.14,
                               "temp_min": 280.74,
                               "temp_max": 280.74,
                               "pressure": 1005,
                               "sea_level": 1005,
                               "grnd_level": 1004,
                               "humidity": 80,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 501,
                                   "main": "Rain",
                                   "description": "moderate rain",
                                   "icon": "10d"
                               }
                           ],
                           "clouds": {
                               "all": 100
                           },
                           "wind": {
                               "speed": 6.54,
                               "deg": 352,
                               "gust": 9.18
                           },
                           "visibility": 10000,
                           "pop": 1,
                           "rain": {
                               "3h": 6.61
                           },
                           "sys": {
                               "pod": "d"
                           },
                           "dt_txt": "2023-12-31 06:00:00"
                       },
                       {
                           "dt": 1704013200,
                           "main": {
                               "temp": 281.73,
                               "feels_like": 279.4,
                               "temp_min": 281.73,
                               "temp_max": 281.73,
                               "pressure": 1004,
                               "sea_level": 1004,
                               "grnd_level": 1002,
                               "humidity": 78,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 500,
                                   "main": "Rain",
                                   "description": "light rain",
                                   "icon": "10n"
                               }
                           ],
                           "clouds": {
                               "all": 100
                           },
                           "wind": {
                               "speed": 4.01,
                               "deg": 6,
                               "gust": 5.93
                           },
                           "visibility": 10000,
                           "pop": 0.97,
                           "rain": {
                               "3h": 0.93
                           },
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-31 09:00:00"
                       },
                       {
                           "dt": 1704024000,
                           "main": {
                               "temp": 282.3,
                               "feels_like": 280.53,
                               "temp_min": 282.3,
                               "temp_max": 282.3,
                               "pressure": 1004,
                               "sea_level": 1004,
                               "grnd_level": 1002,
                               "humidity": 79,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 804,
                                   "main": "Clouds",
                                   "description": "overcast clouds",
                                   "icon": "04n"
                               }
                           ],
                           "clouds": {
                               "all": 100
                           },
                           "wind": {
                               "speed": 3.19,
                               "deg": 350,
                               "gust": 4.66
                           },
                           "visibility": 10000,
                           "pop": 0.77,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-31 12:00:00"
                       },
                       {
                           "dt": 1704034800,
                           "main": {
                               "temp": 282.41,
                               "feels_like": 281.37,
                               "temp_min": 282.41,
                               "temp_max": 282.41,
                               "pressure": 1005,
                               "sea_level": 1005,
                               "grnd_level": 1003,
                               "humidity": 77,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 804,
                                   "main": "Clouds",
                                   "description": "overcast clouds",
                                   "icon": "04n"
                               }
                           ],
                           "clouds": {
                               "all": 87
                           },
                           "wind": {
                               "speed": 2.14,
                               "deg": 356,
                               "gust": 3.66
                           },
                           "visibility": 10000,
                           "pop": 0,
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-31 15:00:00"
                       },
                       {
                           "dt": 1704045600,
                           "main": {
                               "temp": 282.32,
                               "feels_like": 280.45,
                               "temp_min": 282.32,
                               "temp_max": 282.32,
                               "pressure": 1006,
                               "sea_level": 1006,
                               "grnd_level": 1004,
                               "humidity": 75,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 500,
                                   "main": "Rain",
                                   "description": "light rain",
                                   "icon": "10n"
                               }
                           ],
                           "clouds": {
                               "all": 94
                           },
                           "wind": {
                               "speed": 3.38,
                               "deg": 346,
                               "gust": 5.08
                           },
                           "visibility": 10000,
                           "pop": 0.2,
                           "rain": {
                               "3h": 0.11
                           },
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-31 18:00:00"
                       },
                       {
                           "dt": 1704056400,
                           "main": {
                               "temp": 281.61,
                               "feels_like": 279.03,
                               "temp_min": 281.61,
                               "temp_max": 281.61,
                               "pressure": 1008,
                               "sea_level": 1008,
                               "grnd_level": 1006,
                               "humidity": 86,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 501,
                                   "main": "Rain",
                                   "description": "moderate rain",
                                   "icon": "10n"
                               }
                           ],
                           "clouds": {
                               "all": 100
                           },
                           "wind": {
                               "speed": 4.5,
                               "deg": 351,
                               "gust": 6.26
                           },
                           "visibility": 9041,
                           "pop": 0.89,
                           "rain": {
                               "3h": 3.33
                           },
                           "sys": {
                               "pod": "n"
                           },
                           "dt_txt": "2023-12-31 21:00:00"
                       },
                       {
                           "dt": 1704067200,
                           "main": {
                               "temp": 282.24,
                               "feels_like": 280.47,
                               "temp_min": 282.24,
                               "temp_max": 282.24,
                               "pressure": 1011,
                               "sea_level": 1011,
                               "grnd_level": 1009,
                               "humidity": 84,
                               "temp_kf": 0
                           },
                           "weather": [
                               {
                                   "id": 501,
                                   "main": "Rain",
                                   "description": "moderate rain",
                                   "icon": "10d"
                               }
                           ],
                           "clouds": {
                               "all": 100
                           },
                           "wind": {
                               "speed": 3.17,
                               "deg": 346,
                               "gust": 5.59
                           },
                           "visibility": 10000,
                           "pop": 0.94,
                           "rain": {
                               "3h": 3.35
                           },
                           "sys": {
                               "pod": "d"
                           },
                           "dt_txt": "2024-01-01 00:00:00"
                       }             ],
            "message": 0
        }
        """
        
        // In ra đoạn JSON
        return jsonString;
        
        
        
    }
    
    func getDummyJsonContry () -> String {
       let jsonString = """
                [
                {
                       "name": {
                           "common": "Christmas Island",
                           "official": "Territory of Christmas Island",
                           "nativeName": {
                               "eng": {
                                   "official": "Territory of Christmas Island",
                                   "common": "Christmas Island"
                               }
                           }
                       },
                       "tld": [
                           ".cx"
                       ],
                       "cca2": "CX",
                       "ccn3": "162",
                       "cca3": "CXR",
                       "independent": false,
                       "status": "officially-assigned",
                       "unMember": false,
                       "currencies": {
                           "AUD": {
                               "name": "Australian dollar",
                               "symbol": "$"
                           }
                       },
                       "idd": {
                           "root": "+6",
                           "suffixes": [
                               "1"
                           ]
                       },
                       "capital": [
                           "Flying Fish Cove"
                       ],
                       "altSpellings": [
                           "CX",
                           "Territory of Christmas Island"
                       ],
                       "region": "Oceania",
                       "subregion": "Australia and New Zealand",
                       "languages": {
                           "eng": "English"
                       },
                       "translations": {
                           "ara": {
                               "official": "جزيرة كريسماس",
                               "common": "جزيرة كريسماس"
                           },
                           "bre": {
                               "official": "Tiriad Enez Christmas",
                               "common": "Enez Christmas"
                           },
                           "ces": {
                               "official": "Teritorium Vánočního ostrova",
                               "common": "Vánoční ostrov"
                           },
                           "cym": {
                               "official": "Tiriogaeth yr Ynys y Nadolig",
                               "common": "Ynys y Nadolig"
                           },
                           "deu": {
                               "official": "Gebiet der Weihnachtsinsel",
                               "common": "Weihnachtsinsel"
                           },
                           "est": {
                               "official": "Jõulusaare ala",
                               "common": "Jõulusaar"
                           },
                           "fin": {
                               "official": "Joulusaaren alue",
                               "common": "Joulusaari"
                           },
                           "fra": {
                               "official": "Territoire de l'île Christmas",
                               "common": "Île Christmas"
                           },
                           "hrv": {
                               "official": "Teritorij Božićni otok",
                               "common": "Božićni otok"
                           },
                           "hun": {
                               "official": "Karácsony-sziget",
                               "common": "Karácsony-sziget"
                           },
                           "ita": {
                               "official": "Territorio di Christmas Island",
                               "common": "Isola di Natale"
                           },
                           "jpn": {
                               "official": "クリスマス島の領土",
                               "common": "クリスマス島"
                           },
                           "kor": {
                               "official": "크리스마스 섬",
                               "common": "크리스마스 섬"
                           },
                           "nld": {
                               "official": "Grondgebied van Christmas Island",
                               "common": "Christmaseiland"
                           },
                           "per": {
                               "official": "جزیرهٔ کریسمس",
                               "common": "جزیرهٔ کریسمس"
                           },
                           "pol": {
                               "official": "Wyspa Bożego Narodzenia",
                               "common": "Wyspa Bożego Narodzenia"
                           },
                           "por": {
                               "official": "Território da Ilha Christmas",
                               "common": "Ilha do Natal"
                           },
                           "rus": {
                               "official": "Территория острова Рождества",
                               "common": "Остров Рождества"
                           },
                           "slk": {
                               "official": "Teritórium Vianočného ostrova",
                               "common": "Vianočnú ostrov"
                           },
                           "spa": {
                               "official": "Territorio de la Isla de Navidad",
                               "common": "Isla de Navidad"
                           },
                           "srp": {
                               "official": "Божићно Острво",
                               "common": "Божићно Острво"
                           },
                           "swe": {
                               "official": "Julön",
                               "common": "Julön"
                           },
                           "tur": {
                               "official": "Christmas Adası",
                               "common": "Christmas Adası"
                           },
                           "urd": {
                               "official": "ریاستِ جزیرہ کرسمس",
                               "common": "جزیرہ کرسمس"
                           },
                           "zho": {
                               "official": "圣诞岛",
                               "common": "圣诞岛"
                           }
                       },
                       "latlng": [
                           -10.5,
                           105.66666666
                       ],
                       "landlocked": false,
                       "area": 135.0,
                       "demonyms": {
                           "eng": {
                               "f": "Christmas Islander",
                               "m": "Christmas Islander"
                           }
                       },
                       "flag": "🇨🇽",
                       "maps": {
                           "googleMaps": "https://goo.gl/maps/ZC17hHsQZpShN5wk9",
                           "openStreetMaps": "https://www.openstreetmap.org/relation/6365444"
                       },
                       "population": 2072,
                       "car": {
                           "signs": [
                               "AUS"
                           ],
                           "side": "left"
                       },
                       "timezones": [
                           "UTC+07:00"
                       ],
                       "continents": [
                           "Asia"
                       ],
                       "flags": {
                           "png": "https://flagcdn.com/w320/cx.png",
                           "svg": "https://flagcdn.com/cx.svg"
                       },
                       "coatOfArms": {
                           "png": "https://mainfacts.com/media/images/coats_of_arms/cx.png",
                           "svg": "https://mainfacts.com/media/images/coats_of_arms/cx.svg"
                       },
                       "startOfWeek": "monday",
                       "capitalInfo": {
                           "latlng": [
                               -10.42,
                               105.68
                           ]
                       },
                       "postalCode": {
                           "format": "####",
                           "regex": "^(\\d{4})$"
                       }
                   },
                   {
                       "name": {
                           "common": "Eritrea",
                           "official": "State of Eritrea",
                           "nativeName": {
                               "ara": {
                                   "official": "دولة إرتريا",
                                   "common": "إرتريا‎"
                               },
                               "eng": {
                                   "official": "State of Eritrea",
                                   "common": "Eritrea"
                               },
                               "tir": {
                                   "official": "ሃገረ ኤርትራ",
                                   "common": "ኤርትራ"
                               }
                           }
                       },
                       "tld": [
                           ".er"
                       ],
                       "cca2": "ER",
                       "ccn3": "232",
                       "cca3": "ERI",
                       "cioc": "ERI",
                       "independent": true,
                       "status": "officially-assigned",
                       "unMember": true,
                       "currencies": {
                           "ERN": {
                               "name": "Eritrean nakfa",
                               "symbol": "Nfk"
                           }
                       },
                       "idd": {
                           "root": "+2",
                           "suffixes": [
                               "91"
                           ]
                       },
                       "capital": [
                           "Asmara"
                       ],
                       "altSpellings": [
                           "ER",
                           "State of Eritrea",
                           "ሃገረ ኤርትራ",
                           "Dawlat Iritriyá",
                           "ʾErtrā",
                           "Iritriyā"
                       ],
                       "region": "Africa",
                       "subregion": "Eastern Africa",
                       "languages": {
                           "ara": "Arabic",
                           "eng": "English",
                           "tir": "Tigrinya"
                       },
                       "translations": {
                           "ara": {
                               "official": "دولة إريتريا",
                               "common": "إريتريا"
                           },
                           "bre": {
                               "official": "Stad Eritrea",
                               "common": "Eritrea"
                           },
                           "ces": {
                               "official": "Stát Eritrea",
                               "common": "Eritrea"
                           },
                           "cym": {
                               "official": "Gwladwriaeth Eritrea",
                               "common": "Eritrea"
                           },
                           "deu": {
                               "official": "Staat Eritrea",
                               "common": "Eritrea"
                           },
                           "est": {
                               "official": "Eritrea Riik",
                               "common": "Eritrea"
                           },
                           "fin": {
                               "official": "Eritrean valtio",
                               "common": "Eritrea"
                           },
                           "fra": {
                               "official": "État d'Érythrée",
                               "common": "Érythrée"
                           },
                           "hrv": {
                               "official": "Država Eritreji",
                               "common": "Eritreja"
                           },
                           "hun": {
                               "official": "Eritrea",
                               "common": "Eritrea"
                           },
                           "ita": {
                               "official": "Stato di Eritrea",
                               "common": "Eritrea"
                           },
                           "jpn": {
                               "official": "エリトリア国",
                               "common": "エリトリア"
                           },
                           "kor": {
                               "official": "에리트레아국",
                               "common": "에리트레아"
                           },
                           "nld": {
                               "official": "Staat Eritrea",
                               "common": "Eritrea"
                           },
                           "per": {
                               "official": "جمهوری اریتره",
                               "common": "اریتره"
                           },
                           "pol": {
                               "official": "Państwo Erytrea",
                               "common": "Erytrea"
                           },
                           "por": {
                               "official": "Estado da Eritreia",
                               "common": "Eritreia"
                           },
                           "rus": {
                               "official": "Государство Эритрея",
                               "common": "Эритрея"
                           },
                           "slk": {
                               "official": "Eritrejský štát",
                               "common": "Eritrea"
                           },
                           "spa": {
                               "official": "Estado de Eritrea",
                               "common": "Eritrea"
                           },
                           "srp": {
                               "official": "Држава Еритреја",
                               "common": "Еритреја"
                           },
                           "swe": {
                               "official": "Staten Eritrea",
                               "common": "Eritrea"
                           },
                           "tur": {
                               "official": "Eritre Devleti",
                               "common": "Eritre"
                           },
                           "urd": {
                               "official": "ریاستِ ارتریا",
                               "common": "ارتریا"
                           },
                           "zho": {
                               "official": "厄立特里亚",
                               "common": "厄立特里亚"
                           }
                       },
                       "latlng": [
                           15.0,
                           39.0
                       ],
                       "landlocked": false,
                       "borders": [
                           "DJI",
                           "ETH",
                           "SDN"
                       ],
                       "area": 117600.0,
                       "demonyms": {
                           "eng": {
                               "f": "Eritrean",
                               "m": "Eritrean"
                           },
                           "fra": {
                               "f": "Érythréenne",
                               "m": "Érythréen"
                           }
                       },
                       "flag": "🇪🇷",
                       "maps": {
                           "googleMaps": "https://goo.gl/maps/HRyqUpnPwwG6jY5j6",
                           "openStreetMaps": "https://www.openstreetmap.org/relation/296961"
                       },
                       "population": 5352000,
                       "fifa": "ERI",
                       "car": {
                           "signs": [
                               "ER"
                           ],
                           "side": "right"
                       },
                       "timezones": [
                           "UTC+03:00"
                       ],
                       "continents": [
                           "Africa"
                       ],
                       "flags": {
                           "png": "https://flagcdn.com/w320/er.png",
                           "svg": "https://flagcdn.com/er.svg",
                           "alt": "The flag of Eritrea comprises three triangles — a large red isosceles triangle with its base spanning the hoist end and its apex at the midpoint on the fly end, and a green and blue right-angled triangle above and beneath the red triangle. On the hoist side of the red triangle is a golden vertical olive branch encircled by a golden olive wreath."
                       },
                       "coatOfArms": {
                           "png": "https://mainfacts.com/media/images/coats_of_arms/er.png",
                           "svg": "https://mainfacts.com/media/images/coats_of_arms/er.svg"
                       },
                       "startOfWeek": "monday",
                       "capitalInfo": {
                           "latlng": [
                               15.33,
                               38.93
                           ]
                       }
                   },
        
            ]
        """
        return jsonString;
        
    }
}

