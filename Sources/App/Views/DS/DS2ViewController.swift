//
//  DS2ViewController.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 23/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import CoreLocation
import NVActivityIndicatorView
import FirebaseAnalytics
import Toast_Swift

class DS2ViewController: UIViewController{
    private lazy var backgroundView = UIView()
    private lazy var backgroundImageView = UIImageView()
    private lazy var containerView = UIView()
    private lazy var footerView = UIView()
    private lazy var contentView = UIView()
    private lazy var titleHeaderLabel = UILabel()
    private lazy var informationView = UIView()
    private lazy var itemDownloadInformationView = InformationPremiumViewDS2()
    private lazy var itemCategoriesInformationView = InformationPremiumViewDS2()
    private lazy var itemWallpapersInformationView = InformationPremiumViewDS2()
    private lazy var itemRemoveInformationView = InformationPremiumViewDS2()
    private lazy var securedView = UIView()
    private lazy var continueButton = ContinueButton()
    private lazy var backButton = UIButton()
    private lazy var listbuttonView = UIButton()
    private lazy var restorePurchaseButton = UIButton()
    private lazy var termButton = UIButton()
    private lazy var policeButton = UIButton()
    private lazy var activityIndicator = NVActivityIndicatorView( frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    private lazy var bestSaleView = UIView()
    private lazy var bestSaleLabel = UILabel()
    private lazy var bestSaleToggle = UISwitch()
    private lazy var buyView = UIView()
    private lazy var contentBuyView = UIView()
    private lazy var textTopBuyaLabel = UILabel()
    private lazy var textBottomBuyaLabel = UILabel()
    private lazy var buyMoneyLabel = UILabel()
    private lazy var iconBestImage = UIImageView()
    private lazy var weeklyAccessView = UIView()
    private lazy var weeklyAccessLabel = UILabel()
    private lazy var weeklyAccessMoneyLabel = UILabel()
    
    var ds:DS?
    
    var delegate: Delegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpConstraints()
        setUpViews()
        getData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        DispatchQueue.main.asyncAfter(deadline: .now() +  DispatchTimeInterval.seconds(self.ds?.time ?? 0)) {
            self.backButton.isHidden = false
        }
        
    }
    
    func setUpViews() {
        view.backgroundColor = ConfigColor.main_bg
        
        backgroundImageView.image = UIImage(named: "background_DS_2")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundView.layer.addSublayer(UiltFormat.share.setGrandientShowdow(yourWidth: Int(view.frame.width), yourHeight: 575,y: 100))
        containerView.clipsToBounds = true
        
        let attributedText = NSMutableAttributedString(string: "Get FULL ACCESS")
        // Đặt kích thước và độ đậm chữ cho phần đầu của văn bản
        let font1 = UIFont.systemFont(ofSize: 32, weight: .regular)
        let attributes1: [NSAttributedString.Key: Any] = [
            .font: font1,
            .foregroundColor: UIColor.white
        ]
        attributedText.addAttributes(attributes1, range: NSRange(location: 0, length: 3))
        // Đặt kích thước và độ đậm chữ cho phần cuối của văn bản
        let font2 = UIFont.systemFont(ofSize: 32, weight: .bold )
        let attributes2: [NSAttributedString.Key: Any] = [
            .font: font2,
            .foregroundColor: ConfigColor.mainColorDS2
        ]
        attributedText.addAttributes(attributes2, range: NSRange(location: 4, length: 11))
        // Tạo một UILabel và thiết lập attributedText
        titleHeaderLabel.attributedText = attributedText
        titleHeaderLabel.textAlignment = .center
        
        itemDownloadInformationView.icon = UIImage(named: "icon1_DS2")
        itemDownloadInformationView.infoText = "Unlimited art creation"
        
        itemCategoriesInformationView.icon = UIImage(named: "icon2_DS2")
        itemCategoriesInformationView.infoText = "The best image quality"
        
        itemWallpapersInformationView.icon = UIImage(named: "icon3_DS2")
        itemWallpapersInformationView.infoText = "Access all exclusive art styles"
        
        itemRemoveInformationView.icon = UIImage(named: "icon4_DS2")
        itemRemoveInformationView.infoText = "Ad-free experience"
        
        bestSaleView.backgroundColor = ConfigColor.backgroundView
        bestSaleView.layer.cornerRadius = 30
        
        bestSaleLabel.text = "Best Offer. Save 70%"
        bestSaleLabel.textColor = .white
        bestSaleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        bestSaleToggle.onTintColor = ConfigColor.mainColorDS2
        bestSaleToggle.isOn = true
        bestSaleToggle.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged )
        var gradient = UiltFormat.share.gradientImage(bounds: CGRect(x: 0, y: 0, width: view.frame.width - 60, height: 60), colors: [ConfigColor.colorBorderButtonStart,ConfigColor.colorBorderButtonEnd ])
        
        weeklyAccessView.backgroundColor = ConfigColor.backgroundView
        weeklyAccessView.layer.cornerRadius = 30
        weeklyAccessView.layer.borderColor = UIColor(patternImage: gradient).cgColor
        
        weeklyAccessLabel.text = "WEEKLY ACCESS"
        weeklyAccessLabel.textColor = .white
        weeklyAccessLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        weeklyAccessMoneyLabel.text = "4.99$"
        weeklyAccessMoneyLabel.textColor = .white
        weeklyAccessMoneyLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        buyView.layer.cornerRadius = 30
        buyView.layer.borderColor = UIColor(patternImage: gradient).cgColor
        buyView.layer.borderWidth = 2

        textTopBuyaLabel.text = "LIFETIME - FOREVER"
        textTopBuyaLabel.textColor = .white
        textTopBuyaLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        textBottomBuyaLabel.text = "One-time payment"
        textBottomBuyaLabel.textColor = .white
        textBottomBuyaLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        buyMoneyLabel.text = "4.99$"
        buyMoneyLabel.textColor = .white
        buyMoneyLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        iconBestImage.image = UIImage(named: "icon_best_offer")
        iconBestImage.contentMode = .scaleAspectFit
        
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(.black, for: .normal)
        continueButton.setImage(UIImage(named: "icon_continue"), for: .normal)
        continueButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 20)
        continueButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        continueButton.titleAlignment = .center
        continueButton.layer.cornerRadius = 15
        continueButton.layer.addSublayer(UiltFormat.share.setGrandientLayer(yourWidth: 350, yourHeight: 60,colors: [ConfigColor.colorBorderButtonStart, ConfigColor.colorBorderButtonEnd]))
        continueButton.layer.masksToBounds = false
        continueButton.addTarget(self, action: #selector(handleClickNextView), for: .touchUpInside)
        
        //        titleFooterLabel.text = "Restore Purchase | Terms | Policy"
        restorePurchaseButton.setTitle("Restore Purchase", for: .normal)
        restorePurchaseButton.setTitleColor( UIColor(hex: 0x969696), for: .normal)
        restorePurchaseButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 13)
        restorePurchaseButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        
        termButton.setTitle("Terms", for: .normal)
        termButton.setTitleColor( UIColor(hex: 0x717585), for: .normal)
        termButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 13)
        termButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        // Add border to the left
        let leftBorder = CALayer()
        leftBorder.frame = CGRect(x: 0, y: 0, width: 1, height: 18)
        leftBorder.backgroundColor = UIColor.gray.cgColor
        termButton.layer.addSublayer(leftBorder)
        
        // Add border to the right
        let rightBorder = CALayer()
        rightBorder.frame = CGRect(x: 48 - 1, y: 0, width: 1, height: 18)
        rightBorder.backgroundColor = UIColor.gray.cgColor
        termButton.layer.addSublayer(rightBorder)
        
        policeButton.setTitle("Police", for: .normal)
        policeButton.setTitleColor(UIColor(hex: 0x717585), for: .normal)
        policeButton.titleLabel?.font = UIFont(name: "OpenSans-Text", size: 13)
        policeButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        
        backButton.setImage(UIImage(named:"icon_close"), for: .normal)
        backButton.addTarget(self, action: #selector(backView), for: .touchUpInside)
        backButton.isHidden = true
        
        activityIndicator.type = .ballSpinFadeLoader
        activityIndicator.color = UIColor(hex: 0x4ABEFE)
    }
    
    func setUpConstraints() {
        view.addSubview(backgroundView)
        view.addSubview(containerView)
        view.addSubview(footerView)
        view.addSubview(backButton)
        view.addSubview(activityIndicator)
        backgroundView.addSubview(backgroundImageView)
        
        containerView.addSubview(contentView)
        containerView.addSubview(bestSaleView)
        containerView.addSubview(buyView)
        containerView.addSubview(weeklyAccessView)
        containerView.addSubview(footerView)
        containerView.addSubview(iconBestImage)
        
        contentView.addSubview(titleHeaderLabel)
        contentView.addSubview(informationView)
        
        informationView.addSubview(itemDownloadInformationView)
        informationView.addSubview(itemCategoriesInformationView)
        informationView.addSubview(itemWallpapersInformationView)
        informationView.addSubview(itemRemoveInformationView)
        
        bestSaleView.addSubview(bestSaleLabel)
        bestSaleView.addSubview(bestSaleToggle)
        
        buyView.addSubview(contentBuyView)
        buyView.addSubview(buyMoneyLabel)
        
        
        contentBuyView.addSubview(textTopBuyaLabel)
        contentBuyView.addSubview(textBottomBuyaLabel)
        
        weeklyAccessView.addSubview(weeklyAccessLabel)
        weeklyAccessView.addSubview(weeklyAccessMoneyLabel)
        
        footerView.addSubview(securedView)
        footerView.addSubview(continueButton)
        footerView.addSubview(listbuttonView)
        
        listbuttonView.addSubview(restorePurchaseButton)
        listbuttonView.addSubview(termButton)
        listbuttonView.addSubview(policeButton)
        
        backButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(47)
            $0.right.equalToSuperview().offset(-30)
            $0.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        backgroundView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.size.equalTo(CGSize(width: view.frame.width , height: 575))
        }
        
        activityIndicator.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        backgroundImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.size.equalTo(CGSize(width: view.frame.width , height: 750))
        }
        
        contentView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(133)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(333)
            $0.height.equalTo(206)
        }
        
        titleHeaderLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(268)
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
        
        bestSaleView.snp.makeConstraints{
            $0.top.equalTo(contentView.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().offset(-60)
            $0.height.equalTo(55)
        }
        
        bestSaleLabel.snp.makeConstraints{
            $0.left.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width:200 , height: 19))
        }
        
        bestSaleToggle.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-20)
            $0.size.equalTo(CGSize(width: 50, height: 30))
        }
        
        buyView.snp.makeConstraints{
            $0.top.equalTo(bestSaleView.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().offset(-60)
            $0.height.equalTo(60)
        }
        
        contentBuyView.snp.makeConstraints{
            $0.left.equalToSuperview().offset(20)
            $0.height.equalToSuperview()
            $0.width.equalTo(200)
        }
        
        iconBestImage.snp.makeConstraints{
            $0.bottom.equalTo(buyView.snp.top).offset(12)
            $0.right.equalToSuperview().offset(-50)
            $0.size.equalTo(CGSize(width: 100, height: 22))
        }
        
        textTopBuyaLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(9.5)
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(22)
        }
        
        buyMoneyLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-20)
            $0.size.equalTo(CGSize(width: 50, height: 22))
        }
        
        textBottomBuyaLabel.snp.makeConstraints{
            $0.top.equalTo(textTopBuyaLabel.snp.bottom)
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(22)
        }

        
        weeklyAccessView.snp.makeConstraints{
            $0.top.equalTo(buyView.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().offset(-60)
            $0.height.equalTo(55)
        }
        
        weeklyAccessLabel.snp.makeConstraints{
            $0.left.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width:200 , height: 22))
        }
        
        weeklyAccessMoneyLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-20)
            $0.size.equalTo(CGSize(width: 50, height: 22))
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
        
        
        continueButton.snp.makeConstraints{
            $0.top.equalTo(securedView.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 350, height: 60))
        }
        
        listbuttonView.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-33)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 230, height: 18))
        }
        
        restorePurchaseButton.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.size.equalTo(CGSize(width: 120, height: 18))
        }
        
        termButton.snp.makeConstraints{
            $0.leading.equalTo(restorePurchaseButton.snp.trailing)
            $0.size.equalTo(CGSize(width: 48, height: 18))
        }
        
        policeButton.snp.makeConstraints{
            $0.leading.equalTo(termButton.snp.trailing)
            $0.size.equalTo(CGSize(width: 48, height: 18))
        }
        
        
    }
    
    @objc func backView(){
        let hasLaunchedBefore = UserDefaults.standard.bool(forKey: ConfigKey.hasLaunchedBefore)
        if hasLaunchedBefore{
            dismiss(animated: true, completion: nil)
        }else{
            UserDefaults.standard.set(true, forKey: ConfigKey.hasLaunchedBefore)
            let view = MainViewController()
            navigationController?.pushViewController(view, animated: true)
        }
        
    }
    
    func getData(){
        if let ds = UserDefaults.standard.data(forKey: "ds") {
            do {
                  let decoder = JSONDecoder()
                  let dsData = try decoder.decode(DS.self, from: ds)
                  self.ds = dsData
              } catch {
                  self.view.makeToast("error not data", duration: 3.0, position: .center)
              }
        }
    }
    @objc func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            weeklyAccessView.layer.borderWidth = 0
            weeklyAccessView.backgroundColor = ConfigColor.backgroundView
            buyView.layer.borderWidth = 2
            buyView.backgroundColor = UIColor(hex: 0x0f213d)
            
        } else {
            weeklyAccessView.layer.borderWidth = 2
            weeklyAccessView.backgroundColor = UIColor(hex: 0x0f213d)
            buyView.layer.borderWidth = 0
            buyView.backgroundColor =  ConfigColor.backgroundView
        }
    }
    
    @objc func handleClickNextView(){
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.activityIndicator.stopAnimating()
            UserDefaults.standard.set(true, forKey:ConfigKey.isPurchase)
            AnalyticsManager.share.logEvent(name: "purchased", parameters: ["purchased": "lifetime"])
            let hasLaunchedBefore = UserDefaults.standard.bool(forKey: ConfigKey.hasLaunchedBefore)
            if hasLaunchedBefore{
                self.delegate?.isPremium(value: true)
                self.dismiss(animated: true, completion: nil)
            }else{
                UserDefaults.standard.set(true, forKey: ConfigKey.hasLaunchedBefore)
                let view = MainViewController()
                self.navigationController?.pushViewController(view, animated: true)
            }
        }
    
    }
    
}

