//
//  OBViewController.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 09/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import UIKit
import SnapKit
import CoreLocation
import SwiftUI

class OBViewController: UIViewController{
    private lazy var continueButton = ContinueButton()
    private lazy var obColectionView = UICollectionView()
    private var obNumber = 1
    
    var currentIndex = 0
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(.black, for: .normal)
        continueButton.setImage(UIImage(named: "icon_continue"), for: .normal)
        continueButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 20)
        continueButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        continueButton.titleAlignment = .center
        continueButton.layer.cornerRadius = 15
        continueButton.layer.addSublayer(UiltFormat.share.setGrandientLayer(yourWidth: 350, yourHeight: 60))
        continueButton.layer.masksToBounds = false
        continueButton.layer.zPosition = 2
        continueButton.addTarget(self, action: #selector(handleClickNextView), for: .touchUpInside)
        
        self.setCollection()
    }
    
    @objc func handleClickNextView(){
        
        currentIndex += 1
//        if obNumber == 1 {
//            obNumber = 2
//          
//            let transition = CATransition()
//                transition.duration = 0.5
//                transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//                transition.type = CATransitionType.push
//                transition.subtype = CATransitionSubtype.fromRight
//                
//                obColectionView.layer.add(transition, forKey: nil)
//
//            obColectionView.performBatchUpdates({
//                   let indexPaths = [IndexPath(item: 0, section: 0)] // Thay thế với indexPath của cell bạn muốn chuyển đổi
//                   obColectionView.reloadItems(at: indexPaths)
//               }, completion: nil)
            
        
        let index = IndexPath(row: currentIndex, section: 0)
        obColectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
//        }else{
//            let view = DSViewController()
//            navigationController?.pushViewController(view, animated: true)
//            
//        }
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

}
extension OBViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func setCollection(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
//        obColectionView.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: -20, right: 0)
        layout.itemSize = CGSize(width: self.view.bounds.width , height: self.view.bounds.height)
        layout.scrollDirection = .horizontal
        self.obColectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.obColectionView.register(OB1CollectionViewCell.self, forCellWithReuseIdentifier: OB1CollectionViewCell.id)
        self.obColectionView.register(OB2CollectionViewCell.self, forCellWithReuseIdentifier: OB2CollectionViewCell.id)
        self.obColectionView.isScrollEnabled = true
        self.obColectionView.contentMode = .scaleAspectFill
//        self.obColectionView.layer.zPosition = 1
        self.obColectionView.dataSource = self
        self.obColectionView.delegate = self
        obColectionView.isPagingEnabled = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OB1CollectionViewCell.id, for: indexPath) as? OB1CollectionViewCell else {
                return .init()
            }
            return cell
//        } else {
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OB2CollectionViewCell.id, for: indexPath) as? OB2CollectionViewCell else {
//                return .init()
//            }
//            return cell
//        }
           
      
       
    }
    
}

