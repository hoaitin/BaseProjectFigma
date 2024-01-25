//
//  LogoCollectionViewCell.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 25/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//


import UIKit
import Kingfisher

class LogoCollectionViewCell: UICollectionViewCell {
    static let id = "LogoCollectionViewCell"
    private lazy var logoImage = UIImageView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
        setUpConstraints()
    }
    
    func setUpView(){
        logoImage.contentMode = .scaleAspectFill
        logoImage.layer.cornerRadius = 15
        logoImage.clipsToBounds = true
       
    }
    
    func setUpConstraints(){
        contentView.addSubview(logoImage)
        
        logoImage.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        
    }
    
    func setData(logo: String){
        logoImage.image = UIImage(named: logo)
        
    }
    
    func setAction(){
        let gradient = UiltFormat.share.gradientImage(bounds: CGRect(x: 0, y: 0, width: 100, height: 100), colors: [ConfigColor.colorContinueButtonStart, ConfigColor.colorBorderButtonEnd])
        logoImage.layer.borderWidth = 4
        logoImage.layer.borderColor = UIColor(patternImage: gradient).cgColor
        
    }
    
    func hiddenAction(){
       logoImage.layer.borderWidth = 0
        
    }
    
}

