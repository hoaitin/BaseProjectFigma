//
//  Navheader.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 26/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//



import Foundation
import UIKit

class NavHeader: UIView {
    lazy var backButton = UIButton()
    private lazy var titleHeaderLabel =  UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        setUpViews()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews(){
        backButton.contentMode = .scaleAspectFill
        
        titleHeaderLabel.text = "Settings"
        titleHeaderLabel.textColor = .white
        titleHeaderLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleHeaderLabel.textAlignment = .center
    
    }
    
    func setUpConstraints(){
        addSubview(backButton)
        addSubview(titleHeaderLabel)
        
        backButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(10)
            $0.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        titleHeaderLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 200, height: 40))
        }
        
    }
    
    func setData(icon: String, text: String){
        backButton.setImage(UIImage(named: icon), for: .normal)
        titleHeaderLabel.text = text
    }
    
    
    
}

