//
//  SettingTableViewCell.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 17/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation
import UIKit

class SettingTableViewCell: UITableViewCell {
    static let id = "SettingTableViewCell"
    public lazy var containerView = UIView()
    public lazy var titleLabel = UILabel()
    public lazy var iconImageView = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(text: String, index: Int){
        if(index == 0){
            iconImageView.image = UIImage(named: "Vector")
        }
        titleLabel.text = text
    }
    
    func setUpViews(){
        self.selectionStyle = .none
        
        contentView.backgroundColor = .black
        containerView.layer.cornerRadius = 15
        containerView.backgroundColor = UIColor(hex: 0x0a0f17)
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "OpenSans-SemiBold", size: 16)
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        iconImageView.tintColor = .white
        iconImageView.contentMode = .scaleAspectFill
    }
    
    func setUpConstraints(){
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(iconImageView)
        
        containerView.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.size.equalTo(CGSize(width: 342, height: 50))
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: 250, height: 22))
        }
        
        iconImageView.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: 25, height: 25))
        }
    
    }
    
 
}
