//
//  OB1CollectionViewCell.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 09/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//


import UIKit

class OB1CollectionViewCell: UICollectionViewCell {
    static var id = "OB1CollectionViewCell"
    private lazy var backgroundImageView = UIImageView()
    private lazy var navbarTextlabel = GradientLabel()
    
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
        
        backgroundImageView.image = UIImage(named: "surrealistic_wallpaper_21_origin 1")
        backgroundImageView.contentMode = .scaleAspectFill
        
        navbarTextlabel.gradientColors = [UIColor(hex: 0xE8FF8E).cgColor, UIColor(hex: 0x58E0F5).cgColor]
        navbarTextlabel.text = "High Quality 4K Wallpapers"
        navbarTextlabel.textAlignment = .center
        navbarTextlabel.font = UIFont(name: "SP-Pro-Text-Heavy", size: 36)
        navbarTextlabel.font = .systemFont(ofSize: 36)
        navbarTextlabel.numberOfLines = 2
        self.contentView.contentMode = .scaleToFill
    }
    
    func setUpConstraints(){
        contentView.addSubview(backgroundImageView)
        backgroundImageView.addSubview(navbarTextlabel)
        
        backgroundImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        navbarTextlabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-156)
            $0.size.equalTo(CGSize(width: 230, height: 92))
        }
        
    }
}

