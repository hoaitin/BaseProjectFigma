//
//  FomatString.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 27/12/2023.
//  Copyright © 2023 Vulcan Labs. All rights reserved.
//

import Foundation
import UIKit

class ConvertUilt {
    static var shared =  ConvertUilt()
    
    
    
    public  func kelvinToCelsius(temp : Double) -> Double {
        let celsius = temp - 273.15
        return celsius
    }
    public  func kelvinToF(temp : Double) -> Double {
        let f = temp*1.8 - 459.67
        return f
    }
    public func ConvertTemperatureF(temp : Double) -> String {
        let f = kelvinToF(temp: temp)
        let temperature = String(format: "%.0f", f )
        return temperature.appending("°F");
    }
    public func ConvertTemperatureC(temp : Double) -> String {
        let celsius = kelvinToCelsius(temp: temp)
        let temperature = String(format: "%.0f", celsius )
       return temperature.appending("°C");
    }
    
    func loadImage(from imageURLString: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
            // Chuyển đổi đường link thành đối tượng URL
            if let imageURL = URL(string: imageURLString) {
                // Tạo một đối tượng URLSession
                let urlSession = URLSession.shared

                // Tạo một task để tải dữ liệu từ URL
                let task = urlSession.dataTask(with: imageURL) { (data, response, error) in
                    // Kiểm tra lỗi và đảm bảo có dữ liệu
                    if let error = error {
                        completion(.failure(error))
                    } else if let data = data {
                        // Chuyển đổi dữ liệu nhận được thành hình ảnh
                        if let image = UIImage(data: data) {
                            // Gọi closure với hình ảnh nhận được trên luồng chính
                            DispatchQueue.main.async {
                                completion(.success(image))
                            }
                        }
                    }
                }

                // Bắt đầu thực hiện task
                task.resume()
            }
        }
}
