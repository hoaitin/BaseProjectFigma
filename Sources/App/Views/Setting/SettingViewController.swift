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
    private lazy var contentTableView = UITableView()
    private lazy var backButon = UIButton()
    
    private let settings:[String] = ["Share Anime Wallpaper","Term Of Use","Privacy & Security","Contact","Email Us","About Us"]
    
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
      
        cell.setData(text: setting,index: indexPath.row)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 60
    }
    
 
    
}

