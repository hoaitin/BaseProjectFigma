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
    private lazy var navbarTextlabel = GradientLabel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpViews()
        setUpConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        sleep(2)
        self.nextPageHasLaunchedBefore()
    }
    
    func nextPageHasLaunchedBefore(){
        let hasLaunchedBefore = UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
        if !hasLaunchedBefore {
            let viewOB = OBViewController()
            navigationController?.pushViewController(viewOB, animated: true)
        } else {
           let viewMain = MainViewController()
           navigationController?.pushViewController(viewMain, animated: true)
            
        }
        
    }
    
    func setUpViews() {
        backgroundImageView.image = UIImage(named: "splash")
        backgroundImageView.contentMode = .scaleAspectFill // Adjust content mode as needed
        
        navbarTextlabel.gradientColors = [UIColor(hex: 0xE8FF8E).cgColor, UIColor(hex: 0x58E0F5).cgColor]
        navbarTextlabel.text = "Anime 4K Wallpaper"
        navbarTextlabel.textAlignment = .center
        navbarTextlabel.font = UIFont(name: "SP-Pro-Text-Heavy", size: 48)
        navbarTextlabel.font = .boldSystemFont(ofSize: 48)
        navbarTextlabel.numberOfLines = 2
        navbarTextlabel.layer.shadowColor = UIColor.black.cgColor
        navbarTextlabel.layer.shadowRadius = 2
        navbarTextlabel.layer.shadowOpacity = 0.08
        navbarTextlabel.layer.shadowOffset = .init(width: 0, height: 2)
        
        textLabel.text = "Made by Tiny Leo"
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        textLabel.font = UIFont(name: "OpenSans", size: 14)
        textLabel.font = .systemFont(ofSize: 14)
        
    }
    
    func setUpConstraints() {
        view.addSubview(backgroundImageView)
        view.addSubview(textLabel)
        view.addSubview(navbarTextlabel)
        
        backgroundImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        textLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-20)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 120, height: 20))
        }
        
        navbarTextlabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
            $0.size.equalTo(CGSize(width: 268, height: 150))
        }
        
        
    }

}

