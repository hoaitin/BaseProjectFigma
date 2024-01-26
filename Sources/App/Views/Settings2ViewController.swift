//
//  Settings2ViewController.swift
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
import MessageUI

class Settings2ViewController: UIViewController {
    private lazy var navHeaderView = NavHeader()
    private lazy var textAppLabel = UILabel()
    private lazy var contentAppView = UIView()
    private lazy var itemAppView = ItemView()
    private lazy var textAboutLabel = UILabel()
    private lazy var contentTableView = UITableView()
    
    
    private let settings:[Setting2] = [
        Setting2(name: "Share Anime Wallpaper",icon: "icon_setting_share" , link: ""),
        Setting2(name: "Term Of Use", icon: "icon_setting_term" ,link: "https://sites.google.com/tinyleo.com/terms-of-use"),
        Setting2(name: "Privacy & Security",icon: "icon_setting_privacy" , link: "https://sites.google.com/tinyleo.com/privacy-policy"),
        Setting2(name: "Contact", icon: "icon_setting_contact" ,link: "https://sites.google.com/tinyleo.com/contact-us"),
        Setting2(name: "Email Us",icon: "icon_setting_email" , link: ""),
        Setting2(name: "About Us", icon: "icon_setting_about" ,link: "https://sites.google.com/tinyleo.com/about-us")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // gesture:
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        view.backgroundColor = ConfigColor.main_bg
        
        navHeaderView.setData(icon: "icon_back_settings", text: "Settings")
        navHeaderView.backButton.addTarget(self, action: #selector(nextBackView), for: .touchUpInside)
        
        textAppLabel.textColor = ConfigColor.main_setting2
        textAppLabel.text = "APP"
        textAppLabel.font = UIFont(name: "SF-Pro-Text-Regular", size: 16)
        
        var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(nextViewListLogo))
        tapGestureRecognizer.numberOfTapsRequired = 1
        contentAppView.addGestureRecognizer(tapGestureRecognizer)
        contentAppView.isUserInteractionEnabled = true
        contentAppView.backgroundColor =  UIColor(hex: 0x0B0F17)
        
        itemAppView.setData(icon: "icon_star", text: "Change App Icon")
        
        textAboutLabel.textColor = ConfigColor.main_setting2
        textAboutLabel.text = "ABOUT"
        textAboutLabel.font = UIFont(name: "SF-Pro-Text-Regular", size: 16)
        
        self.setTableView()
        
    }
    
    func setUpConstraints() {
        view.addSubview(navHeaderView)
        view.addSubview(textAppLabel)
        view.addSubview(contentAppView)
        view.addSubview(textAboutLabel)
        view.addSubview(contentTableView)
        
        contentAppView.addSubview(itemAppView)
        
        navHeaderView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(47)
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(40)
           
        }
        
        textAppLabel.snp.makeConstraints{
            $0.top.equalTo(navHeaderView.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(10)
            $0.height.equalTo(19)
        }
        
        contentAppView.snp.makeConstraints{
            $0.top.equalTo(textAppLabel.snp.bottom).offset(7)
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        itemAppView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(25)
            $0.size.equalTo(CGSize(width: view.frame.width - 25, height: 20))
        }
        
        textAboutLabel.snp.makeConstraints{
            $0.top.equalTo(contentAppView.snp.bottom).offset(40)
            $0.left.equalToSuperview().offset(10)
            $0.height.equalTo(19)
        }
        
        contentTableView.snp.makeConstraints{
            $0.top.equalTo(textAboutLabel.snp.bottom).offset(26)
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(360)
        }
        
        
    }
    
    @objc func nextViewListLogo(){
        let view = ListLogoViewController()
        navigationController?.pushViewController(view, animated: true)
    }
    
    @objc func nextBackView(){
        navigationController?.popViewController(animated: true)
    }
    
    
}
extension Settings2ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func setTableView(){
      
        self.contentTableView.isScrollEnabled = false
        self.contentTableView.register(Setting2TableViewCell.self, forCellReuseIdentifier: Setting2TableViewCell.id)
        self.contentTableView.dataSource = self
        self.contentTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Setting2TableViewCell.id, for: indexPath) as? Setting2TableViewCell else {
            return .init()
        }
        let setting = settings[indexPath.row]
      
        cell.setData(icon: setting.icon, text: setting.name)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let setting = settings[indexPath.row]
        
        if setting.link != "" {
            if let url = URL(string: setting.link) {
                let safariViewController = SFSafariViewController(url: url)
                present(safariViewController, animated: true, completion: nil)
            }
        }else {
            if indexPath.row == 0 {
                let textToShare = "https://apps.apple.com/vn/app/id6471563037"
                let itemsToShare = [textToShare]

                       // Tạo UIActivityViewController
                let activityViewController = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
                present(activityViewController, animated: true, completion: nil)
            }else {
           
            }
            
        }
       
    }
    
 
    
}


