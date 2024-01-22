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
    
    func loadImage(link: String , backgroundImageView: UIImageView){

//      MainViewModel.share.loadImage(imageItem: imageItem, backgroundImageView: backgroundImageView)
        let url = URL(string:  link)
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
            case .success(let value): break
            case .failure(let error):
                print("error")
            }
        }
    }
    
    func isLoadImage(image:String) -> Bool {
        if var listImage = UserDefaults.standard.array(forKey: "images") as? [String] {
            let isLoadImage = listImage.contains(where: {$0 == image})
            if(!isLoadImage){
                listImage.append(image)
                UserDefaults.standard.set(listImage, forKey: "images")
            }
            return isLoadImage
        }
        
        UserDefaults.standard.set([image], forKey: "images")
        
        return false
    }
    
    func randomImage(images: [String], imageOld: String) ->String? {
        while true && images.count > 1 {
               if let image = images.randomElement(), image != imageOld {
                 return image
                
               }
        }
        return nil
    }
    
    func backImage(imageItem: String, listImage: [String]) -> String? {
        if let index = listImage.firstIndex(where: {$0 == imageItem}){
            if (index < 1){
                let image = listImage[listImage.count - 1]
                return image
            }else {
                let image = listImage[index - 1]
                return image
            }
        }
        return nil
    }
    
    func nextImage(imageItem: String, listImage: [String]) -> String? {
        if let index = listImage.firstIndex(where: {$0 == imageItem}){
            if (index < listImage.count  - 1){
                let image = listImage[index + 1]
                return image
            }else {
                let image = listImage[0]
                return image
            }
        }
        return nil
    }

}
