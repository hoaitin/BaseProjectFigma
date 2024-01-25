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
import SafariServices
import MessageUI

class SettingViewController: UIViewController , MFMailComposeViewControllerDelegate{
    private lazy var titleLabel = UILabel()
    private lazy var contentTableView = UITableView()
    private lazy var backButon = UIButton()
    
    private let settings:[Setting] = [
      Setting(name: "Share Anime Wallpaper", link: ""),
      Setting(name: "Term Of Use", link: "https://sites.google.com/tinyleo.com/terms-of-use"),
      Setting(name: "Privacy & Security", link: "https://sites.google.com/tinyleo.com/privacy-policy"),
      Setting(name: "Contact", link: "https://sites.google.com/tinyleo.com/contact-us"),
      Setting(name: "Email Us", link: ""),
      Setting(name: "About Us", link: "https://sites.google.com/tinyleo.com/about-us")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // gesture:
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        view.backgroundColor = ConfigColor.main_bg
        titleLabel.text = "Settings"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "OpenSans-Text", size: 32)
        titleLabel.font = .boldSystemFont(ofSize: 32)
        
        backButon.setImage(UIImage(named: "tabbar_back"), for: .normal)
        backButon.tintColor = .white
        backButon.addTarget(self, action: #selector(nextBackView), for: .touchUpInside)
        
        self.setTableView()
        
    }
    
    func setUpConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(backButon)
        view.addSubview(contentTableView)
        
        
        backButon.snp.makeConstraints{
            $0.top.equalToSuperview().offset(40)
            $0.left.equalToSuperview().offset(25)
            $0.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(97)
            $0.left.equalToSuperview().offset(25)
            $0.size.equalTo(CGSize(width: 130, height: 44))
        }
        
         contentTableView.snp.makeConstraints{
             $0.top.equalTo(titleLabel.snp.bottom).offset(26)
             $0.trailing.leading.equalToSuperview()
             $0.height.equalTo(360)
        }
        
    }
    
    @objc func nextBackView(){
        navigationController?.popViewController(animated: true)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
           // Xử lý kết quả của việc gửi email
           controller.dismiss(animated: true, completion: nil)
       }

}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource{
    
    func setTableView(){
        self.contentTableView.backgroundColor = .black
        self.contentTableView.separatorStyle = .none
        self.contentTableView.isScrollEnabled = false
        self.contentTableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.id)
        self.contentTableView.dataSource = self
        self.contentTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.id, for: indexPath) as? SettingTableViewCell else {
            return .init()
        }
        let setting = settings[indexPath.row]
      
        cell.setData(text: setting.name,index: indexPath.row)
        
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
                if MFMailComposeViewController.canSendMail() {
                           // Tạo MFMailComposeViewController
                           let mailComposeViewController = MFMailComposeViewController()
                           mailComposeViewController.mailComposeDelegate = self
                           mailComposeViewController.setToRecipients(["recipient@example.com"]) // Địa chỉ email người nhận

                           // Đặt chủ đề và nội dung email
                           mailComposeViewController.setSubject("Feedback Anime Diffusion")
                           mailComposeViewController.setMessageBody("Nội dung email", isHTML: false)

                           // Hiển thị MFMailComposeViewController
                           present(mailComposeViewController, animated: true, completion: nil)
                       } else {
                           // Thiết bị không hỗ trợ gửi email
                           // Xử lý trường hợp này theo cách bạn muốn
                           print("Thiết bị không hỗ trợ gửi email.")
                       }
            }
            
        }
       
    }
    
 
    
}

