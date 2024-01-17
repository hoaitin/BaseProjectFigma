//
//  DSViewController.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 08/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//


import Foundation
import UIKit
import SnapKit
import CoreLocation

class DSViewController: UIViewController{
    private lazy var backgroundView = UIView()
    private lazy var backgroundImageView = UIImageView()
    private lazy var containerView = UIView()
    private lazy var footerView = UIView()
    private lazy var contentView = UIView()
    private lazy var titleHeaderLabel = UILabel()
    private lazy var informationView = UIView()
    private lazy var itemDownloadInformationView = InformationPremiumView()
    private lazy var itemCategoriesInformationView = InformationPremiumView()
    private lazy var itemWallpapersInformationView = InformationPremiumView()
    private lazy var itemRemoveInformationView = InformationPremiumView()
    private lazy var buyButton = UIButton()
    private lazy var textBuyButtonlabel = UILabel()
    private lazy var iconButton = UIImageView()
    private lazy var securedView = UIView()
    private lazy var iconSecuredImage = UIImageView()
    private lazy var textSecuredlabel = UILabel()
    private lazy var continueButton = ContinueButton()
    private lazy var titleFooterLabel = UILabel()
    private lazy var backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpConstraints()
        setUpViews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let hasLaunchedBefore = UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
        if hasLaunchedBefore {
            backButton.isHidden = false
        }
    }
    
    func setUpViews() {
        view.backgroundColor = ConfigColor.main_bg
        
        backgroundImageView.image = UIImage(named: "background_DS_1")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundView.layer.addSublayer(UiltFormat.share.setGrandientShowdow(yourWidth: Int(view.frame.width), yourHeight: 172,y: 300))
        containerView.clipsToBounds = true
        
        let attributedText = NSMutableAttributedString(string: "Unlock Premium")
        // Đặt kích thước và độ đậm chữ cho phần đầu của văn bản
        let font1 = UIFont.systemFont(ofSize: 20, weight: .medium)
        let attributes1: [NSAttributedString.Key: Any] = [
            .font: font1,
            .foregroundColor: UIColor.white
        ]
        attributedText.addAttributes(attributes1, range: NSRange(location: 0, length: 6))
        // Đặt kích thước và độ đậm chữ cho phần cuối của văn bản
        let font2 = UIFont.systemFont(ofSize: 30, weight: .bold)
        let attributes2: [NSAttributedString.Key: Any] = [
            .font: font2,
            .foregroundColor: UIColor.white
        ]
        attributedText.addAttributes(attributes2, range: NSRange(location: 6, length: 8))
        // Tạo một UILabel và thiết lập attributedText
        titleHeaderLabel.attributedText = attributedText
        titleHeaderLabel.textAlignment = .left
               
        itemDownloadInformationView.icon = UIImage(named: "icon_commit_1")
        itemDownloadInformationView.infoText = "Download Unlimited Wallpapers"
        
        itemCategoriesInformationView.icon = UIImage(named: "icon_commit_2")
        itemCategoriesInformationView.infoText = "10+ Unique Wallpaper Categories"
        
        itemWallpapersInformationView.icon = UIImage(named: "icon_commit_3")
        itemWallpapersInformationView.infoText = "High Quality 4K Wallpapers"
        
        itemRemoveInformationView.icon = UIImage(named: "icon_commit_4")
        itemRemoveInformationView.infoText = "Remove Ads"
        
        let gradient = UiltFormat.share.gradientImage(bounds: CGRect(x: 0, y: 0, width: view.frame.width - 60, height: 60), colors: [ConfigColor.colorBorderButtonStart,ConfigColor.colorBorderButtonEnd ])
        buyButton.backgroundColor = .black
        buyButton.layer.cornerRadius = 30
        buyButton.layer.borderColor = UIColor(patternImage: gradient).cgColor
        buyButton.layer.borderWidth = 2
        buyButton.clipsToBounds = true
        
        textBuyButtonlabel.text = "39.99$ / Lifetime Forever"
        textBuyButtonlabel.textColor = .white
        textBuyButtonlabel.font = UIFont(name: "OpenSans-Text", size: 16)
        textBuyButtonlabel.textAlignment = .left
        
        iconButton.image = UIImage(named: "icon_best_seller")
        iconButton.contentMode = .scaleAspectFill
        
        iconSecuredImage.image = UIImage(named: "icon_secured")
        iconSecuredImage.contentMode = .scaleAspectFit
        
        textSecuredlabel.text = "Secured with iTunes. Billed once."
        textSecuredlabel.textColor = .gray
        textSecuredlabel.font = UIFont(name: "OpenSans-Text", size: 13)
        textSecuredlabel.font = .systemFont(ofSize: 13)
        textSecuredlabel.textAlignment = .right
        
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(.black, for: .normal)
        continueButton.setImage(UIImage(named: "icon_continue"), for: .normal)
        continueButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 20)
        continueButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        continueButton.titleAlignment = .center
        continueButton.layer.cornerRadius = 15
        continueButton.layer.addSublayer(UiltFormat.share.setGrandientLayer(yourWidth: 350, yourHeight: 60))
        continueButton.layer.masksToBounds = false
        continueButton.addTarget(self, action: #selector(handleClickNextView), for: .touchUpInside)
        
        titleFooterLabel.text = "Restore Purchase | Terms | Policy"
        titleFooterLabel.textColor = .gray
        titleFooterLabel.font = UIFont(name: "OpenSans-Text", size: 13)
        titleFooterLabel.font = .systemFont(ofSize: 13)
        titleFooterLabel.textAlignment = .center
        
        backButton.setImage(UIImage(named:"icon_close"), for: .normal)
        backButton.addTarget(self, action: #selector(backView), for: .touchUpInside)
        backButton.isHidden = true
    }
    
    func setUpConstraints() {
        view.addSubview(backgroundView)
        view.addSubview(containerView)
        view.addSubview(footerView)
        view.addSubview(backButton)
        backgroundView.addSubview(backgroundImageView)
        
        containerView.addSubview(contentView)
        containerView.addSubview(buyButton)
        containerView.addSubview(footerView)
        
        contentView.addSubview(titleHeaderLabel)
        contentView.addSubview(informationView)
        
        informationView.addSubview(itemDownloadInformationView)
        informationView.addSubview(itemCategoriesInformationView)
        informationView.addSubview(itemWallpapersInformationView)
        informationView.addSubview(itemRemoveInformationView)
        
        buyButton.addSubview(textBuyButtonlabel)
        buyButton.addSubview(iconButton)
        
        footerView.addSubview(securedView)
        footerView.addSubview(continueButton)
        footerView.addSubview(titleFooterLabel)
        
        securedView.addSubview(iconSecuredImage)
        securedView.addSubview(textSecuredlabel)
        
        backButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(47)
            $0.right.equalToSuperview().offset(-30)
            $0.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        backgroundView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.size.equalTo(CGSize(width: view.frame.width , height: 472))
        }
        
        backgroundImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.size.equalTo(CGSize(width: view.frame.width , height: 533))
        }
        
        contentView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(containerView.snp.width).offset(-60)
            $0.height.equalTo(206)
        }
        
        titleHeaderLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.width.equalTo(contentView.snp.width)
            $0.height.equalTo(41)
        }
        
        informationView.snp.makeConstraints{
            $0.top.equalTo(titleHeaderLabel.snp.bottom)
            $0.width.equalTo(contentView.snp.width)
            $0.height.equalToSuperview().offset(-41)
        }
        
        itemDownloadInformationView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.width.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        itemCategoriesInformationView.snp.makeConstraints{
            $0.top.equalTo(itemDownloadInformationView.snp.bottom).offset(7)
            $0.width.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        itemWallpapersInformationView.snp.makeConstraints{
            $0.top.equalTo(itemCategoriesInformationView.snp.bottom).offset(7)
            $0.width.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        itemRemoveInformationView.snp.makeConstraints{
            $0.top.equalTo(itemWallpapersInformationView.snp.bottom).offset(7)
            $0.width.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        buyButton.snp.makeConstraints{
            $0.top.equalTo(contentView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().offset(-60)
            $0.height.equalTo(60)
        }
        
        textBuyButtonlabel.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.height.equalTo(22)
            $0.width.equalToSuperview().offset(-50)
        }
        
        iconButton.snp.makeConstraints{
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.size.equalTo(CGSize(width: 100, height: 30))
        }
        
        footerView.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.size.equalTo(CGSize(width: view.frame.width , height: 164))
        }
        
        securedView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.height.equalTo(20)
            $0.width.equalToSuperview()
        }
        
        iconSecuredImage.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: 18, height: 18))
            $0.trailing.equalTo(textSecuredlabel.snp.leading)
        }
        
        textSecuredlabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: 208, height: 18))
            $0.centerX.equalToSuperview()
        }
        
        continueButton.snp.makeConstraints{
            $0.top.equalTo(securedView.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 350, height: 60))
        }
        
        titleFooterLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(continueButton.snp.bottom).offset(15)
            $0.size.equalTo(CGSize(width: 210, height: 18))
        }
        
    }
    
    @objc func backView(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleClickNextView(){
        UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
        let view = MainViewController()
        navigationController?.pushViewController(view, animated: true)
    }
    
    
}

