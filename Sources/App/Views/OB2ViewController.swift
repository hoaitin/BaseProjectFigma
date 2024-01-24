//
//  OB2ViewController.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 23/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import UIKit
import SnapKit
import CoreLocation
import SwiftUI
import Toast_Swift

class OB2ViewController: UIViewController{
    private lazy var continueButton = UIButton()
    private lazy var obColectionView = UICollectionView()
    
    private var obNumber = 1
    var currentIndex = 0
    var ds: DS?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpViews()
        setUpConstraints()
        getData()
    }
    
    func setUpViews() {
        view.backgroundColor = ConfigColor.main_bg
        
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(.black, for: .normal)
        continueButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 20)
        continueButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        continueButton.layer.cornerRadius = 15
        continueButton.layer.addSublayer(UiltFormat.share.setGrandientLayer(yourWidth: 350, yourHeight: 60,colors: [UIColor(hex: 0xE8FF8E), UIColor(hex: 0x58E0F5)]))
        continueButton.layer.masksToBounds = false
        continueButton.layer.zPosition = 2
        continueButton.addTarget(self, action: #selector(handleClickNextView), for: .touchUpInside)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width , height: view.frame.height)
        layout.scrollDirection = .horizontal
        self.obColectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        self.obColectionView.register(OB3CollectionViewCell.self, forCellWithReuseIdentifier: OB3CollectionViewCell.id)
        self.obColectionView.register(OB4CollectionViewCell.self, forCellWithReuseIdentifier: OB4CollectionViewCell.id)
        self.obColectionView.register(OB5CollectionViewCell.self, forCellWithReuseIdentifier: OB5CollectionViewCell.id)
        self.obColectionView.isScrollEnabled = false
        self.obColectionView.contentMode = .scaleAspectFill
        self.obColectionView.backgroundColor = ConfigColor.main_bg
        self.obColectionView.dataSource = self
        self.obColectionView.delegate = self
        self.obColectionView.contentInsetAdjustmentBehavior = .never
        obColectionView.allowsMultipleSelection = false
        obColectionView.isPagingEnabled = true
    }
    
    func setUpConstraints() {
    
        view.addSubview(obColectionView)
        view.addSubview(continueButton)
        
        continueButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-70)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 350, height: 60))
        }
        
        obColectionView.snp.makeConstraints{
            $0.edges.size.equalToSuperview()
        }
        
    }

    @objc func handleClickNextView(){
        
        currentIndex += 1
        if obNumber == 1 {
            obNumber = 2
        
        let index = IndexPath(row: currentIndex, section: 0)
        obColectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        } else if obNumber == 2 {
            obNumber = 3
            let index = IndexPath(row: currentIndex, section: 0)
            self.continueButton.setTitle("GO!", for: .normal)
            obColectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }else{
            guard let dsData = self.ds else { return }
            
            switch dsData.version {
            case "directstore_ver1" :
                let view = DSViewController()
                navigationController?.pushViewController(view, animated: true)
            case "directstore_ver2" :
                let view = DS2ViewController()
                navigationController?.pushViewController(view, animated: true)
            default: break
            }
           
            
        }
    }
    func getData(){
        if let ds = UserDefaults.standard.data(forKey: "ds") {
            do {
                  let decoder = JSONDecoder()
                  let dsData = try decoder.decode(DS.self, from: ds)
                  self.ds = dsData
                   
              } catch {
                  self.view.makeToast("error not data", duration: 3.0, position: .center)
              }
        }
    }
    
}
extension OB2ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OB3CollectionViewCell.id, for: indexPath) as? OB3CollectionViewCell else {
                return .init()
            }
            return cell
        } else if indexPath.row == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OB4CollectionViewCell.id, for: indexPath) as? OB4CollectionViewCell else {
                return .init()
            }
            return cell
        }else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OB5CollectionViewCell.id, for: indexPath) as? OB5CollectionViewCell else {
                return .init()
            }
            return cell
        }
    }
    
}


