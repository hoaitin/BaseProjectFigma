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
    private lazy var categoriesCollectionview = UICollectionView()
    private var categories: [Category] = [
     Category(image: "man", name: "Man"),
     Category(image: "woman", name: "Woman"),
     Category(image: "landscape", name: "Landscape"),
     Category(image: "animal", name: "Animal"),
     Category(image: "supper_car", name: "Supper Car"),
     Category(image: "mecha_robot", name: "Mecha Robot"),
    ]
    
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
        
        navbarTextlabel.gradientColors = [UIColor(hex: 0xE8FF8E).cgColor, UIColor(hex: 0x58E0F5).cgColor]
        navbarTextlabel.text = "Stunning Categories"
        navbarTextlabel.textAlignment = .center
        navbarTextlabel.font = UIFont(name: "SP-Pro-Text-Heavy", size: 36)
        navbarTextlabel.font = .boldSystemFont(ofSize: 36)
        navbarTextlabel.numberOfLines = 2
        
        self.setCategoriesCollection()
    }
    
    func setUpConstraints(){
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(navbarTextlabel)
        contentView.addSubview(categoriesCollectionview)
        
        
        backgroundImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        
        navbarTextlabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-156)
            $0.size.equalTo(CGSize(width: 250, height: 92))
        }
        
        categoriesCollectionview.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.size.equalTo(CGSize(width: contentView.frame.width - 40, height: 254))
        }
    }
    
}
extension OB2CollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func setCategoriesCollection(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        layout.itemSize = CGSize(width: 100, height: 120)
        layout.scrollDirection = .vertical
        self.categoriesCollectionview = UICollectionView(frame: contentView.frame, collectionViewLayout: layout)
        self.categoriesCollectionview.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.id)
        self.categoriesCollectionview.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.categoriesCollectionview.isScrollEnabled = false
        self.categoriesCollectionview.dataSource = self
        self.categoriesCollectionview.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.id, for: indexPath) as? CategoryCollectionViewCell else {
            return .init()
        }
        
        let category = categories[indexPath.row]
        cell.setData(image: category.image, text: category.name)
        
        return cell
    }
    
    
}
