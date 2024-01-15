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
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

            let renderer = UIGraphicsImageRenderer(bounds: bounds)

            return renderer.image { ctx in
                gradientLayer.render(in: ctx.cgContext)
            }
        }
}
