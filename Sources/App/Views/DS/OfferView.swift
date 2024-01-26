//
//  OfferView.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 26/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation
import UIKit

class OfferView: UIView {
    private lazy var textLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    private lazy var buyMoneyLabel = UILabel()

    
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
    textLabel.textColor = .white
    textLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
    descriptionLabel.textColor = .white
    descriptionLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
    buyMoneyLabel.textColor = .white
    buyMoneyLabel.font = .systemFont(ofSize: 16, weight: .semibold)
     
    }
    
    func setData(text:String , description: String , buyMoney: String, isBest: Bool){
        textLabel.text = text
        buyMoneyLabel.text = buyMoney
        
        if isBest {
            descriptionLabel.text = description
            textLabel.snp.makeConstraints{
                $0.top.equalToSuperview().offset(9.5)
            }
        }else {
            
            descriptionLabel.isHidden = true
            textLabel.snp.makeConstraints{
                $0.centerY.equalToSuperview()
            }
        }
        
    }
    
    func setUpConstraints(){
        addSubview(textLabel)
        addSubview(descriptionLabel)
        addSubview(buyMoneyLabel)
        
        textLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(9.5)
            $0.left.equalToSuperview().offset(20)
            $0.size.equalTo(CGSize(width: 250, height: 22))
        }
        
        descriptionLabel.snp.makeConstraints{
            $0.top.equalTo(textLabel.snp.bottom)
            $0.left.equalToSuperview().offset(20)
            $0.size.equalTo(CGSize(width: 250, height: 17))
        }
        
        buyMoneyLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-20)
            $0.size.equalTo(CGSize(width: 50, height: 22))
        }
        
    }
    
    
    
}


