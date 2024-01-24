//
//  SplashViewController.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 05/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//


import UIKit
import SnapKit
import CoreLocation

class SplashViewController: UIViewController{
    private lazy var backgroundImageView = UIImageView()
    private lazy var textLabel = UILabel()
    private lazy var navbarTextImageView = UIImageView()
    let remoteConfig =  RemoteConfigManager.share
    let userDefaults = UserDefaults.standard
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        
        getData()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpViews()
        setUpConstraints()
      
    }
    
    func setUpViews() {
        backgroundImageView.image = UIImage(named: "splash")
        backgroundImageView.contentMode = .scaleAspectFill // Adjust content mode as needed
     
        navbarTextImageView.image = UIImage(named: "titleNav")
        navbarTextImageView.contentMode = .scaleAspectFit
        
        textLabel.text = "Made by Tiny Leo"
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        textLabel.font = UIFont(name: "OpenSans", size: 14)
        textLabel.font = .systemFont(ofSize: 14)
        
    }
    
 
    func setUpConstraints() {
        view.addSubview(backgroundImageView)
        view.addSubview(textLabel)
        view.addSubview(navbarTextImageView)
        
        backgroundImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        textLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-20)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 120, height: 20))
        }
        
        navbarTextImageView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
            $0.size.equalTo(CGSize(width: 280, height: 160))
        }
    }
    
    func getData(){
        var isLoadData =  userDefaults.bool(forKey: "loadData")
        DispatchQueue.global().async {
            while !isLoadData {
                    sleep(5)
                isLoadData = self.userDefaults.bool(forKey: "loadData")
            }
            
            let onboarding = self.userDefaults.string(forKey: "onboarding")
    
            if isLoadData {
                DispatchQueue.main.sync {
                    self.nextPageHasLaunchedBefore()
                }

            }
            
        }
    }
    
    func nextPageHasLaunchedBefore(){
        let hasLaunchedBefore = UserDefaults.standard.bool(forKey: ConfigKey.hasLaunchedBefore)
        if !hasLaunchedBefore {
            self.nextOnboarding()
        } else {
           let viewMain = MainViewController()
           navigationController?.pushViewController(viewMain, animated: true)
            
        }
    }
    
    func nextOnboarding(){
        if let onboarding = userDefaults.string(forKey: "onboarding") {
           
            switch onboarding {
            case "onboarding_v1":
                 let view =  OBViewController()
                navigationController?.pushViewController(view, animated: true)
            case "onboarding_v2":
                let view = OB2ViewController()
               navigationController?.pushViewController(view, animated: true)
            default:
                let view = OBViewController()
               navigationController?.pushViewController(view, animated: true)
            }
            
        }
        
    }

}
