//
//  OB5CollectionViewCell.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 23/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//



import UIKit

class OB5CollectionViewCell: UICollectionViewCell {
    static var id = "OB5CollectionViewCell"
    private lazy var backgroundImageView = UIImageView()
    private lazy var navbarTextlabel = UILabel()
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
        backgroundImageView.layer.addSublayer(UiltFormat.share.setGrandientShowdow(yourWidth: Int(contentView.frame.width), yourHeight: Int(contentView.frame.height),y: 0))
    
        navbarTextlabel.textColor = .white
        navbarTextlabel.text = "Discover this app"
        navbarTextlabel.textAlignment = .center
        navbarTextlabel.font = UIFont(name: "SP-Pro-Text-Heavy", size: 36)
        navbarTextlabel.font = UIFont.systemFont(ofSize: 36, weight: .heavy)
        navbarTextlabel.numberOfLines = 2
        
        contentImage.image = UIImage(named: "onboarding_7_3")
        contentImage.contentMode  = .scaleAspectFill
        contentImage.layer.cornerRadius = 20
        contentImage.layer.borderColor = UIColor.black.cgColor
        contentImage.layer.borderWidth = 2
        contentImage.layer.masksToBounds = true
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
            $0.size.equalTo(CGSize(width: contentView.frame.width - 52, height: 451))
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(54)
        }
    }
    
}

