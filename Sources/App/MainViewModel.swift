//
//  MainViewModel.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 15/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import NVActivityIndicatorView
class MainViewModel{
    public static var share:MainViewModel = MainViewModel()
    
    func loadImage(imageItem: ImageItem , backgroundImageView: UIImageView ,activityIndicator: NVActivityIndicatorView ,showErrorMessageAlert: @escaping (_ message: String) -> Void){
//            MainViewModel.share.loadImage(imageItem: imageItem, backgroundImageView: backgroundImageView)
        let url = URL(string: imageItem.linkImage)
        let processor = DownsamplingImageProcessor(size: backgroundImageView.bounds.size)
        backgroundImageView.kf.indicatorType = .activity
        backgroundImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.5)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                backgroundImageView.layer.contents = value.image.cgImage
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    activityIndicator.stopAnimating()
                }
            case .failure(let error):
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    activityIndicator.stopAnimating()
                }
              
                showErrorMessageAlert("Failed to load image.")
            }
        }
    }
    
    func testimage() {
    
    }
    
}
