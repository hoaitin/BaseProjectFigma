//
//  UiltFormat.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 08/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation
import QuartzCore
import UIKit
class UiltFormat{
    public static var share:UiltFormat = UiltFormat()
    
    public func setGrandientLayer(yourWidth: Int ,yourHeight : Int)-> CAGradientLayer {
        // Tạo một gradient layer
        let gradientLayer = CAGradientLayer()        // Đặt màu cho gradient
        gradientLayer.colors = [UIColor(hex: 0xE8FF8E).cgColor, UIColor(hex: 0x58E0F5).cgColor]
        
        // Đặt điểm bắt đầu và kết thúc của gradient
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = 15
        gradientLayer.zPosition = -1
        
        // Đặt frame cho gradient layer (đối với ví dụ này, chúng ta sẽ đặt full width và height của view)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: yourWidth, height: yourHeight)
        return gradientLayer
    }
    public func setGrandientShowdow(yourWidth: Int ,yourHeight : Int, y : Int)-> CAGradientLayer {
        // Tạo một gradient layer
        let gradientLayer = CAGradientLayer()        // Đặt màu cho gradient
        gradientLayer.colors = [UIColor.black.withAlphaComponent(0.9).cgColor, UIColor.black.withAlphaComponent(0.01).cgColor]
        
        // Đặt điểm bắt đầu và kết thúc của gradient
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        //        gradientLayer.cornerRadius = 15
        //        gradientLayer.zPosition = -1
        
        // Đặt frame cho gradient layer (đối với ví dụ này, chúng ta sẽ đặt full width và height của view)
        gradientLayer.frame = CGRect(x: 0, y: y, width: yourWidth, height: yourHeight)
        return gradientLayer
    }
    
    func gradientImage(bounds: CGRect, colors: [UIColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map(\.cgColor)
        
        // This makes it left to right, default is top to bottom
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint =  CGPoint(x: 0.5, y: 1.0)
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        
        return renderer.image { ctx in
            gradientLayer.render(in: ctx.cgContext)
        }
    }
    
    func formatTime() ->String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: currentDate)
        return dateString;
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
extension UIColor {
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
