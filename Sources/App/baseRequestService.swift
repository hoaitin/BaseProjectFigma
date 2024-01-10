//
//  BaseRequestService.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 26/12/2023.
//  Copyright © 2023 Vulcan Labs. All rights reserved.
//

import Foundation
import Alamofire

typealias WeatherDataCallback = (_ isSuccess: Bool,_ data: Any?,_ code: String?) ->()
class Connectivity{
    static func isConnectiedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
struct BaseRequestService {
    static let share = BaseRequestService()
    
    func requestApiWeather(lat: Double, lon: Double,activityIndicator: UIActivityIndicatorView,completion: @escaping WeatherDataCallback) {
        activityIndicator.startAnimating()
        guard Connectivity.isConnectiedToInternet() else {
            // Handle no internet connection case
            activityIndicator.stopAnimating()
            completion(false, nil,"no network connection")
            return
        }
        let parameters: [String: Any] = [
            "lat": lat,
            "lon": lon,
            "appid": NetworkConstants.shared.apiKey
        ]

        let url = NetworkConstants.shared.serverAddress
        AF.request(url,method: .get,parameters: parameters)
            .validate()
            .responseDecodable(of: ContryWeather.self) { response in
                switch response.result {
                case .success(let weatherResponse):
                    // Process the response and create an array of DayWeather objects
                    let group = Dictionary(grouping: weatherResponse.list, by: { $0.getDate() })
                    var daysWeather: [DayWeather] = []
                    
                    for (key, weathers) in group {
                        let dayWeather = DayWeather(contry: weatherResponse.city.country,timezone: weatherResponse.city.timezone, weatherData: weathers)
                        daysWeather.append(dayWeather)
                    }
                    activityIndicator.stopAnimating()
                    // Call the completion handler with the result
                    completion(true,daysWeather,"success")
                case .failure(let error):
                    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                        print("Lỗi giải mã JSON: \(utf8Text)")
                    } else {
                        print("Lỗi: \(error)")
                    }
                    activityIndicator.stopAnimating()
                    completion(false,nil,"error")
                    // Xử lý lỗi ở đây
                }
            }
       
    }
    func requestApiContry(activityIndicator: UIActivityIndicatorView ,completion: @escaping WeatherDataCallback){
        activityIndicator.startAnimating()
        guard Connectivity.isConnectiedToInternet() else {
            // Handle no internet connection case
            activityIndicator.stopAnimating()
            completion(false, nil,"no network connection")
     
            return
        }
        let url = NetworkConstants.shared.addressApiContries
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: [Country].self){ response in
                switch response.result {
                case .success(let ContryData):
                    // Process the response and create an array of DayWeather objects
                    activityIndicator.stopAnimating()
                     completion(true,ContryData,"success")
                 
                case .failure(let error):
                    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                        print("Lỗi giải mã JSON: \(utf8Text)")
                    } else {
                        print("Lỗi: \(error)")
                    }
                    activityIndicator.stopAnimating()
                    completion(false,nil,"error")
                    // Xử lý lỗi ở đây
                }
            }
      
    }
  
        
        
        
    
    
   
}
