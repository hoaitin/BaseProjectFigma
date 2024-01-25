//
//  ListLogoViewController.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 25/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import CoreLocation
import SafariServices
import MessageUI

class ListLogoViewController: UIViewController {
    private lazy var backButton = UIButton()
    private lazy var titleHeaderLabel = UILabel()
    private lazy var changeIconButton = UIButton()
    private lazy var logoCollectionView = UICollectionView()
    
    private let listLogo: [String] = ["app_icon_main1","app_icon_main2","app_icon_main3"]
    private var selectedIndexPath: IndexPath?
    private var logo: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // gesture:
        setUpViews()
        setUpConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        selectedIndexPath = IndexPath(item: 0, section: 0)
        self.logo = listLogo.first
        self.logoCollectionView.reloadData()
    }
    
    func setUpViews() {
        view.backgroundColor = ConfigColor.main_bg
        
        backButton.setImage(UIImage(named: "icon_back_settings"), for: .normal)
        backButton.contentMode = .scaleAspectFill
        backButton.addTarget(self, action: #selector(nextBackView), for: .touchUpInside)
        
        titleHeaderLabel.text = "Change icon"
        titleHeaderLabel.textColor = .white
        titleHeaderLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleHeaderLabel.textAlignment = .center
        
        changeIconButton.setTitle("Change", for: .normal)
        changeIconButton.setTitleColor(.white, for: .normal)
        changeIconButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 16)
        changeIconButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        changeIconButton.layer.cornerRadius = 25
        changeIconButton.layer.addSublayer(UiltFormat.share.setGrandientLayer(yourWidth: 230, yourHeight: 50,colors: [ConfigColor.colorBorderButtonStart, ConfigColor.colorBorderButtonEnd],radius: 25))
        changeIconButton.layer.masksToBounds = false
        changeIconButton.addTarget(self, action: #selector(handleChangeLogo), for: .touchUpInside)
        
        self.setCollection()
        
    }
    
    func setUpConstraints() {
        view.addSubview(backButton)
        view.addSubview(titleHeaderLabel)
        view.addSubview(logoCollectionView)
        view.addSubview(changeIconButton)
        
        
        backButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(47)
            $0.left.equalToSuperview().offset(10)
            $0.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        titleHeaderLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(47)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 200, height: 40))
        }
        
        logoCollectionView.snp.makeConstraints{
            $0.top.equalTo(backButton.snp.bottom).offset(10)
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        changeIconButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-59)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 230, height: 50))
        }
        
    }
    
    @objc func handleChangeLogo(){
        if UIApplication.shared.supportsAlternateIcons {
            UIApplication.shared.setAlternateIconName("app_icon_main1") { error in
                       if let error = error {
                           print("Không thể thay đổi biểu tượng: \(error.localizedDescription)")
                       } else {
                           print("Biểu tượng đã được thay đổi thành: \(self.logo)")
                       }
                   }
        }
    }
    
    
    @objc func nextBackView(){
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension ListLogoViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func setCollection(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 104, height: 104)
       
        self.logoCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        self.logoCollectionView.register(LogoCollectionViewCell.self, forCellWithReuseIdentifier: LogoCollectionViewCell.id)
        self.logoCollectionView.showsHorizontalScrollIndicator = false
        self.logoCollectionView.backgroundColor =  ConfigColor.main_bg
        self.logoCollectionView.dataSource = self
        self.logoCollectionView.delegate = self
        if let flowLayout = self.logoCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumInteritemSpacing = 20 // Khoảng cách giữa các cột
//            flowLayout.minimumLineSpacing = 0      // Khoảng cách giữa các hàng
            flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listLogo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LogoCollectionViewCell.id, for: indexPath) as? LogoCollectionViewCell else {
            return .init()
        }
        let logo = listLogo[indexPath.row]
        cell.setData(logo: logo)
        if indexPath.item == selectedIndexPath?.item {
            cell.setAction()
        }else{
            cell.hiddenAction()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
        // Kiểm tra xem có cell nào được chọn trước đó không
        if let previousSelectedIndexPath = selectedIndexPath {
            if let previousSelectedCell = collectionView.cellForItem(at: previousSelectedIndexPath) as?
                LogoCollectionViewCell {
                if(!previousSelectedCell.isSelected){
                   
                    previousSelectedCell.hiddenAction()
                
                }
              
            }
        }
        // Lấy ra cell mới được chọn và thay đổi màu chữ của text
        if let newSelectedCell = collectionView.cellForItem(at: indexPath) as? LogoCollectionViewCell {
            if newSelectedCell.isSelected {
                self.logo = listLogo[indexPath.row]
              
                newSelectedCell.setAction() // Hoặc màu chữ bạn muốn sử dụng
            }
        }
      
        selectedIndexPath = indexPath
   
        
    }
  
    
}


