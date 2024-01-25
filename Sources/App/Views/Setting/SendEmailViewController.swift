//
//  SendEmailViewController.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 24/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import CoreLocation
import SafariServices

class SendEmailViewController: UIViewController{
    private lazy var backButton = UIButton()
    private lazy var titleHeaderLabel = UILabel()
    private lazy var sendButton = UIButton()
   
    override func viewDidLoad() { 
        super.viewDidLoad()
        // gesture:
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        view.backgroundColor = .white
        
        backButton.setTitleColor(.blue, for: .normal)
        backButton.setTitle("Huỷ", for: .normal)
        
        titleHeaderLabel.text = "Feedback Anime Diffusion"
        titleHeaderLabel.textColor = .black
        titleHeaderLabel.font = .systemFont(ofSize: 26, weight: .bold)
        
        sendButton.setTitleColor(.blue, for: .normal)
        sendButton.setTitle("Gởi", for: .normal)
        
    }
    
    func setUpConstraints() {
        view.addSubview(backButton)
        view.addSubview(titleHeaderLabel)
        view.addSubview(sendButton)
        
        backButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(48)
            $0.left.equalToSuperview().offset(25)
            $0.size.equalTo(CGSize(width: 40, height: 30))
        }
        
        titleHeaderLabel.snp.makeConstraints{
            $0.top.equalTo(backButton.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(25)
            $0.size.equalTo(CGSize(width: 320, height: 40))
        }
        
        sendButton.snp.makeConstraints{
            $0.top.equalTo(backButton.snp.bottom).offset(10)
            $0.right.equalToSuperview().offset(-25)
            $0.size.equalTo(CGSize(width: 40, height: 40))
        }
    }
    
    @objc func nextBackView(){
        navigationController?.popViewController(animated: true)
    }

}

