//
//  InformationPremiumView.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 08/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import UIKit

class InformationPremiumView: UIView {
    private lazy var iconImage = UIImageView()
    private lazy var titleLabel = UILabel()

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
    
    var icon: UIImage? {
            didSet {
                iconImage.image = icon
            }
        }

    var infoText: String? {
            didSet {
                titleLabel.text = infoText
            }
    }
    
    func setUpViews() {
        iconImage.contentMode = .scaleAspectFit
        
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.textAlignment = .left
        
    }
    
    func setUpConstraints() {
        addSubview(iconImage)
        addSubview(titleLabel)
        
        iconImage.snp.makeConstraints{
            $0.left.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        titleLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(iconImage.snp.trailing).offset(15)
            $0.width.equalToSuperview().offset(-50)
            $0.height.equalTo(30)
        }
        
    }
}
