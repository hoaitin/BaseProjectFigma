//
//  CategoryCollectionViewCell.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 05/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    static let id = "CategoryCollectionViewCell"
    private lazy var categoryImage = UIImageView()
    private lazy var nameCategoryLabel = UILabel()
    
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
        categoryImage.contentMode = .scaleAspectFill
        categoryImage.layer.cornerRadius = 15
        categoryImage.clipsToBounds = true
        
        nameCategoryLabel.font = UIFont(name: "OpenSans-Text", size: 14)
        nameCategoryLabel.font = .systemFont(ofSize: 14)
        nameCategoryLabel.textColor = .white
        nameCategoryLabel.textAlignment = .center
       
    }
    
    func setUpConstraints(){
        contentView.addSubview(categoryImage)
        contentView.addSubview(nameCategoryLabel)
        
        categoryImage.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        nameCategoryLabel.snp.makeConstraints{
            $0.top.equalTo(categoryImage.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width:contentView.frame.width , height: 17))
        }
        
    }
    
    func setData(category: CategoryItem){
        UiltFormat.share.loadImage(from: category.imageCategory) { result in
            switch result {
            case .success(let image):
                self.categoryImage.image = image
            case .failure(let error):
                print("Lỗi khi tải hình ảnh: \(error.localizedDescription)")
            }
        }
        nameCategoryLabel.text = category.nameCategory
     
    }
    
    func setAction(){
        let gradient = UiltFormat.share.gradientImage(bounds: CGRect(x: 0, y: 0, width: 100, height: 100), colors: [ConfigColor.colorContinueButtonStart, ConfigColor.colorBorderButtonEnd])
        categoryImage.layer.borderWidth = 5
        categoryImage.layer.borderColor = UIColor(patternImage: gradient).cgColor
        
        nameCategoryLabel.font = UIFont(name: "SF-Pro-Text-Heavy", size: 14)
        nameCategoryLabel.font = .systemFont(ofSize: 14, weight: .heavy)
    }
    func hiddenAction(){
        categoryImage.layer.borderWidth = 0
        
        nameCategoryLabel.font = UIFont(name: "SF-Pro-Text-Medium", size: 14)
        nameCategoryLabel.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
}
