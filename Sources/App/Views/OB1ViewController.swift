//
//  Bo1ViewController.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 05/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation

import UIKit
import SnapKit
import CoreLocation

class OB1ViewController: UIViewController{
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        backgroundImageView.image = UIImage(named: "background_bo1")
        backgroundImageView.contentMode = .scaleAspectFill
        
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(.black, for: .normal)
        continueButton.setImage(UIImage(named: "icon_continue"), for: .normal)
        
        continueButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 20)
        continueButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        continueButton.layer.cornerRadius = 15
        continueButton.layer.addSublayer(UiltFormat.share.setGrandientLayer(yourWidth: 350, yourHeight: 60))
        continueButton.layer.masksToBounds = false
        continueButton.addTarget(self, action: #selector(handleClickNextView), for: .touchUpInside)
        
        navbarTextlabel.gradientColors = [UIColor(hex: 0xE8FF8E).cgColor, UIColor(hex: 0x58E0F5).cgColor]
        navbarTextlabel.text = "Stunning Categories"
        navbarTextlabel.textAlignment = .center
        navbarTextlabel.font = UIFont(name: "SP-Pro-Text-Heavy", size: 36)
        navbarTextlabel.font = .boldSystemFont(ofSize: 36)
        navbarTextlabel.numberOfLines = 2
        
        self.setCategoriesCollection()
        
    }
    
    func setUpConstraints() {
        view.addSubview(backgroundImageView)
        view.addSubview(continueButton)
        view.addSubview(navbarTextlabel)
        view.addSubview(categoriesCollectionview)
        
        
        backgroundImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        continueButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-20)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 350, height: 60))
        }
        
        navbarTextlabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(continueButton.snp.top).offset(-26)
            $0.size.equalTo(CGSize(width: 250, height: 92))
        }
        
        categoriesCollectionview.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.size.equalTo(CGSize(width: view.frame.width - 40, height: 254))
        }
        
    }
    
    @objc func handleClickNextView(){
        let view = DSViewController()
        navigationController?.pushViewController(view, animated: true)
    }

}

extension OB1ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func setCategoriesCollection(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        layout.itemSize = CGSize(width: 100, height: 120)
        layout.scrollDirection = .vertical
        self.categoriesCollectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
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
