//
//  FooterVIew.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 26/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation
import UIKit

class FooterView: UIView {
    lazy var restorePurchaseButton = UIButton()
    lazy var termButton = UIButton()
    lazy var policeButton = UIButton()
    
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
        
        restorePurchaseButton.setTitle("Restore Purchase", for: .normal)
        restorePurchaseButton.setTitleColor( UIColor(hex: 0x969696), for: .normal)
        restorePurchaseButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 13)
        restorePurchaseButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        
        termButton.setTitle("Terms", for: .normal)
        termButton.setTitleColor( UIColor(hex: 0x717585), for: .normal)
        termButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 13)
        termButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        // Add border to the left
        let leftBorder = CALayer()
        leftBorder.frame = CGRect(x: 0, y: 0, width: 1, height: 18)
        leftBorder.backgroundColor = UIColor.gray.cgColor
        termButton.layer.addSublayer(leftBorder)
        
        // Add border to the right
        let rightBorder = CALayer()
        rightBorder.frame = CGRect(x: 48 - 1, y: 0, width: 1, height: 18)
        rightBorder.backgroundColor = UIColor.gray.cgColor
        termButton.layer.addSublayer(rightBorder)
        
        policeButton.setTitle("Police", for: .normal)
        policeButton.setTitleColor(UIColor(hex: 0x717585), for: .normal)
        policeButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 13)
        policeButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
     
    }
    
    func setUpConstraints(){
        addSubview(restorePurchaseButton)
        addSubview(termButton)
        addSubview(policeButton)
       
        restorePurchaseButton.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.size.equalTo(CGSize(width: 120, height: 18))
        }
        
        termButton.snp.makeConstraints{
            $0.leading.equalTo(restorePurchaseButton.snp.trailing)
            $0.size.equalTo(CGSize(width: 48, height: 18))
        }
        
        policeButton.snp.makeConstraints{
            $0.leading.equalTo(termButton.snp.trailing)
            $0.size.equalTo(CGSize(width: 48, height: 18))
        }
        
    }
    
    
    
}

