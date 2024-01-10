//
//  SettingViewController.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 08/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import CoreLocation

class SettingViewController: UIViewController{
    private lazy var titleLabel = UILabel()
    private lazy var contentView = UIView()
    private lazy var shareButton = ContinueButton(type: .system)
    private lazy var termOfUseButton = UIButton(type: .system)
    private lazy var contactButton = UIButton(type: .system)
    private lazy var emailButton = UIButton(type: .system)
    private lazy var aboutUsButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        titleLabel.text = "Setting"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "OpenSans-Text", size: 32)
        titleLabel.font = .boldSystemFont(ofSize: 32)
        
        shareButton.setTitle("Share Anime Wallpaper", for: .normal)
        shareButton.setTitleColor(.white, for: .normal)
        shareButton.setImage(UIImage(named: "icon_continue"), for: .normal)
        shareButton.titleLabel?.textAlignment = .left
        shareButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 16)
        shareButton.titleAlignment = .left
        shareButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        shareButton.layer.cornerRadius = 15
        shareButton.layer.masksToBounds = false
        shareButton.backgroundColor = UIColor(hex: 0x0B0F17)
        
        termOfUseButton.setTitle("Term Of Use", for: .normal)
        termOfUseButton.setTitleColor(.white, for: .normal)
        termOfUseButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 16)
        termOfUseButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        termOfUseButton.layer.cornerRadius = 15
        termOfUseButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -175, bottom: 0, right: 0)
        termOfUseButton.backgroundColor = UIColor(hex: 0x0B0F17)
        
        contactButton.setTitle("Contact", for: .normal)
        contactButton.setTitleColor(.white, for: .normal)
        contactButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 16)
        contactButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        contactButton.layer.cornerRadius = 15
        contactButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -195, bottom: 0, right: 0)
        contactButton.backgroundColor = UIColor(hex: 0x0B0F17)
        
        emailButton.setTitle("Email Us", for: .normal)
        emailButton.setTitleColor(.white, for: .normal)
        emailButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 16)
        emailButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        emailButton.layer.cornerRadius = 15
        emailButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -195, bottom: 0, right: 0)
        emailButton.backgroundColor = UIColor(hex: 0x0B0F17)
        
        aboutUsButton.setTitle("About Us", for: .normal)
        aboutUsButton.setTitleColor(.white, for: .normal)
        aboutUsButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 16)
        aboutUsButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        aboutUsButton.layer.cornerRadius = 15
        aboutUsButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -195, bottom: 0, right: 0)
        aboutUsButton.backgroundColor = UIColor(hex: 0x0B0F17)
        
    }
    
    func setUpConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(contentView)
        contentView.addSubview(shareButton)
        contentView.addSubview(termOfUseButton)
        contentView.addSubview(contactButton)
        contentView.addSubview(emailButton)
        contentView.addSubview(aboutUsButton)
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(97)
            $0.left.equalToSuperview().offset(25)
            $0.size.equalTo(CGSize(width: 130, height: 44))
        }
        
        contentView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(26)
            $0.size.equalTo(CGSize(width: view.frame.width , height: 360))
        }
        
        shareButton.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().offset(-50)
            $0.height.equalTo(50)
        }
        
        termOfUseButton.snp.makeConstraints{
            $0.top.equalTo(shareButton.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().offset(-50)
            $0.height.equalTo(50)
        }
        
        contactButton.snp.makeConstraints{
            $0.top.equalTo(termOfUseButton.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().offset(-50)
            $0.height.equalTo(50)
        }
        
        emailButton.snp.makeConstraints{
            $0.top.equalTo(contactButton.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().offset(-50)
            $0.height.equalTo(50)
        }
        
        aboutUsButton.snp.makeConstraints{
            $0.top.equalTo(emailButton.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().offset(-50)
            $0.height.equalTo(50)
        }
        
    
    }

}

