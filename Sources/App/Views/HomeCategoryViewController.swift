//
//  HomeCategoryViewController.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 08/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import UIKit
import SnapKit
import CoreLocation

class HomeCategoryViewController: UIViewController{
    private lazy var backgroundImageView = UIImageView()
    private lazy var headerView = UIView()
    private lazy var menuLeftButton = UIButton()
    private lazy var kingButton = UIButton()
    private lazy var downloadButton = UIButton()
    private lazy var refreshButton = UIButton()
    private lazy var categoriesView = UIView()
    private lazy var categoriesCollectionView = UICollectionView()
    private var categories: [Category] = [
     Category(image: "man", name: "Man"),
     Category(image: "woman", name: "Woman"),
     Category(image: "landscape", name: "Landscape"),
     Category(image: "animal", name: "Animal"),
     Category(image: "supper_car", name: "Supper Car"),
     Category(image: "mecha_robot", name: "Mecha Robot"),
    ]
    private var category:Category?
    
    private var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpViews()
        setUpConstraints()
        
    }
    
    func setUpViews() {
        backgroundImageView.image = UIImage(named: "background-main");
        backgroundImageView.contentMode = .scaleAspectFill
    
        menuLeftButton.setImage(UIImage(named: "icon_menu"), for: .normal)
        menuLeftButton.imageView?.contentMode = .scaleAspectFit
        
        kingButton.setImage(UIImage(named: "icon_king"), for: .normal)
        kingButton.imageView?.contentMode = .scaleAspectFit
        
        refreshButton.setImage(UIImage(named: "icon_refresh"), for: .normal)
        refreshButton.imageView?.contentMode = .scaleAspectFit
        
        downloadButton.setImage(UIImage(named: "icon_down"), for: .normal)
        downloadButton.imageView?.contentMode = .scaleAspectFit
        
        categoriesView.layer.addSublayer(UiltFormat.share.setGrandientShowdow(yourWidth: Int(view.frame.width), yourHeight: 221,y: 0))
        setCategoriesCollection()
        
    }
    
    func setUpConstraints() {
        view.addSubview(backgroundImageView)
        view.addSubview(headerView)
        headerView.addSubview(menuLeftButton)
        headerView.addSubview(kingButton)
        headerView.addSubview(refreshButton)
        headerView.addSubview(downloadButton)
        view.addSubview(categoriesView)
        categoriesView.addSubview(categoriesCollectionView)
        
        backgroundImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        headerView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(40)
            $0.size.equalTo(CGSize(width: view.frame.width, height: 40))
        }
        
        menuLeftButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        kingButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.equalTo(menuLeftButton.snp.right).offset(5)
            $0.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        downloadButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: 40, height: 40))
            $0.right.equalToSuperview().offset(-10)
        }
        
        refreshButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: 40, height: 40))
            $0.trailing.equalTo(downloadButton.snp.leading).offset(5)
        }
        
        categoriesView.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.size.equalTo(CGSize(width: view.frame.width, height: 221))
        }
        
        categoriesCollectionView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(50)
            $0.left.equalToSuperview().offset(14)
            $0.width.equalToSuperview().offset(-14)
            $0.height.equalTo(150)
        }
        
        
    }

}
extension HomeCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func setCategoriesCollection(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        layout.itemSize = CGSize(width: 100, height: 120)
        self.categoriesCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.categoriesCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.id)
        self.categoriesCollectionView.showsHorizontalScrollIndicator = false
        self.categoriesCollectionView.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.categoriesCollectionView.dataSource = self
        self.categoriesCollectionView.delegate = self
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Kiểm tra xem có cell nào được chọn trước đó không
                if let previousSelectedIndexPath = selectedIndexPath {
                    // Lấy ra cell trước đó và thay đổi màu chữ của text
                    if let previousSelectedCell = collectionView.cellForItem(at: previousSelectedIndexPath) as? CategoryCollectionViewCell {
                        previousSelectedCell.hiddenAction()
                    }
                }
                // Lấy ra cell mới được chọn và thay đổi màu chữ của text
                if let newSelectedCell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
                    let category = categories[indexPath.row]
                    self.category = category
                    backgroundImageView.image = UIImage(named: category.image )
                    newSelectedCell.setAction() // Hoặc màu chữ bạn muốn sử dụng
                }
        selectedIndexPath = indexPath
        
    }
    
    
}
