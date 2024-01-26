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
import Toast_Swift

class ListLogoViewController: UIViewController {
    private lazy var navHeaderView = NavHeader()
    private lazy var changeIconButton = UIButton()
    private lazy var logoCollectionView = UICollectionView()
    private var logos:[Logo] = [
        // id : String
     Logo(id:"0", name: "app_icon_main1", link: "AppIcon 10"),
     Logo(id:"1",name: "app_icon_main2", link: "AppIcon 11"),
     Logo(id:"2",name: "app_icon_main3", link: "AppIcon 12"),
     Logo(id:"3", name: "app_icon_main1", link: "AppIcon 10"),
     Logo(id:"4",name: "app_icon_main2", link: "AppIcon 11"),
     Logo(id:"5",name: "app_icon_main3", link: "AppIcon 12"),
     Logo(id:"6", name: "app_icon_main1", link: "AppIcon 10"),
     Logo(id:"7",name: "app_icon_main2", link: "AppIcon 11"),
     Logo(id:"8",name: "app_icon_main3", link: "AppIcon 12"),
     Logo(id:"9", name: "app_icon_main1", link: "AppIcon 10"),
     Logo(id:"10",name: "app_icon_main2", link: "AppIcon 11"),
     Logo(id:"11",name: "app_icon_main3", link: "AppIcon 12"),
     Logo(id:"12", name: "app_icon_main1", link: "AppIcon 10"),
     Logo(id:"13",name: "app_icon_main2", link: "AppIcon 11"),
     Logo(id:"14",name: "app_icon_main3", link: "AppIcon 12")
    ]
    
    private var logo: Logo?
    private var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // gesture:
        setUpViews()
        setUpConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        let idLogo = UserDefaults.standard.string(forKey: "idLogo")
        if let index = logos.firstIndex(where: { $0.id == idLogo }) {
            selectedIndexPath = IndexPath(item: index, section: 0)
            logo = logos[index]
        }else {
            selectedIndexPath = IndexPath(item: 0, section: 0)
            logo = logos[0]
            
        }
        logoCollectionView.reloadData()
        
    }
    
    func setUpViews() {
        view.backgroundColor = ConfigColor.main_bg
        navHeaderView.setData(icon: "icon_back_settings", text: "Change icon")
        navHeaderView.backButton.addTarget(self, action: #selector(nextBackView), for: .touchUpInside)
        
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
        view.addSubview(navHeaderView)
        view.addSubview(logoCollectionView)
        view.addSubview(changeIconButton)
        
        navHeaderView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(47)
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(40)
           
        }
        
        logoCollectionView.snp.makeConstraints{
            $0.top.equalTo(navHeaderView.snp.bottom).offset(10)
            $0.trailing.leading.equalToSuperview()
            $0.bottom.equalTo(changeIconButton.snp.top).offset(-20)
        }
        
        changeIconButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-59)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 230, height: 50))
        }
        
    }
    
    @objc func handleChangeLogo(){
        guard UIApplication.shared.supportsAlternateIcons else { return }
        UIApplication.shared.setAlternateIconName(self.logo?.link) { error in
            if let error = error {
                self.view.makeToast("error \(error.localizedDescription)", duration: 3.0, position: .center)
            } else {
                UserDefaults.standard.set(self.logo?.id, forKey: "idLogo")
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
            flowLayout.minimumInteritemSpacing = Configs.isHasNortch ? 20 : 10 // Khoảng cách giữa các cột
//            flowLayout.minimumLineSpacing = 0      // Khoảng cách giữa các hàng
            flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return logos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LogoCollectionViewCell.id, for: indexPath) as? LogoCollectionViewCell else {
            return .init()
        }
        let logo = logos[indexPath.row]
        cell.setData(logo: logo.name)
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
                self.logo = logos[indexPath.row]
              
                newSelectedCell.setAction() // Hoặc màu chữ bạn muốn sử dụng
            }
        }
      
        selectedIndexPath = indexPath
   
        
    }
  
    
}


