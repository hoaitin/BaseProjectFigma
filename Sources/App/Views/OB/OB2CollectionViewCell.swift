//
//  OB2CollectionViewCell.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 09/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//


import UIKit

class OB2CollectionViewCell: UICollectionViewCell {
    static var id = "OB2CollectionViewCell"
    private lazy var backgroundImageView = UIImageView()
    private lazy var navbarTextlabel = GradientLabel()
    private lazy var continueButton = ContinueButton()
    private lazy var contentImage = UIImageView()
    
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
        backgroundImageView.image = UIImage(named: "background_bo1")
        backgroundImageView.contentMode = .scaleAspectFill
        
        navbarTextlabel.gradientColors = [ConfigColor.colorContinueButtonStart.cgColor,ConfigColor.colorBorderButtonEnd.cgColor]
        navbarTextlabel.text = "Stunning Categories"
        navbarTextlabel.textAlignment = .center
        navbarTextlabel.font = UIFont(name: "SP-Pro-Text-Heavy", size: 36)
        navbarTextlabel.font = .boldSystemFont(ofSize: 36)
        navbarTextlabel.numberOfLines = 2
        
        contentImage.image = UIImage(named: "image_categories")
        contentImage.contentMode  = .scaleAspectFill
    }
    
    func setUpConstraints(){
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(navbarTextlabel)
        contentView.addSubview(contentImage)
        
        backgroundImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        navbarTextlabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 250, height: 92))
            $0.bottom.equalToSuperview().offset(-156)
            
        }
        
        contentImage.snp.makeConstraints{
            $0.size.equalTo(CGSize(width: contentView.frame.width - 40, height: 254))
            if contentView.frame.height >= 812 {
                $0.center.equalToSuperview()
            } else {
                $0.centerX.equalToSuperview()
                $0.top.equalToSuperview().offset(120)
            }
        }
    }
    
}
