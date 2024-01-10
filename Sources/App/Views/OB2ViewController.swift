//
//  BO2ViewController.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 05/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//


import UIKit
import SnapKit
import CoreLocation
import SwiftUI

class OB2ViewController: UIViewController{
    private lazy var backgroundImageView = UIImageView()
    private lazy var navbarTextlabel = GradientLabel()
    private lazy var continueButton = ContinueButton()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        backgroundImageView.image = UIImage(named: "surrealistic_wallpaper_21_origin 1")
        backgroundImageView.contentMode = .scaleAspectFill
        
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(.black, for: .normal)
        continueButton.setImage(UIImage(named: "icon_continue"), for: .normal)
        continueButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 20)
        continueButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        continueButton.titleLabel?.textAlignment = .center
        continueButton.layer.cornerRadius = 15
        continueButton.layer.addSublayer(UiltFormat.share.setGrandientLayer(yourWidth: 350, yourHeight: 60))
        continueButton.layer.masksToBounds = false
        continueButton.addTarget(self, action: #selector(handleClickNextView), for: .touchUpInside)
        
        navbarTextlabel.gradientColors = [UIColor(hex: 0xE8FF8E).cgColor, UIColor(hex: 0x58E0F5).cgColor]
        navbarTextlabel.text = "High Quality 4K Wallpapers"
        navbarTextlabel.textAlignment = .center
        navbarTextlabel.font = UIFont(name: "SP-Pro-Text-Heavy", size: 36)
        navbarTextlabel.font = .systemFont(ofSize: 36)
        navbarTextlabel.numberOfLines = 2
        
    }
    
    @objc func handleClickNextView(){
        let view = OB1ViewController()
        navigationController?.pushViewController(view, animated: true)
    }
    
    func setUpConstraints() {
        view.addSubview(backgroundImageView)
        view.addSubview(continueButton)
        view.addSubview(navbarTextlabel)
        
        backgroundImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        continueButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-20)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 350, height: 60))
        }
        
        navbarTextlabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(continueButton.snp.top).offset(-26)
            $0.size.equalTo(CGSize(width: 230, height: 92))
        }
        
    }

}
extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
