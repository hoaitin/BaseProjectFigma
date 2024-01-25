//
//  Setting2TableViewCell.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 24/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//


import Foundation
import UIKit

class Setting2TableViewCell: UITableViewCell {
    static let id = "Setting2TableViewCell"
    public lazy var itemView = ItemView()
 
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(icon: String , text: String){
        itemView.setData(icon: icon , text: text)
    }
    
    func setUpViews(){
        contentView.backgroundColor =  UIColor(hex: 0x0B0F17)
        
    }
    
    func setUpConstraints(){
        contentView.addSubview(itemView)
        
        itemView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(25)
            $0.size.equalTo(CGSize(width: itemView.frame.width - 25, height: 20))
        }
    
    }
    
 
}
