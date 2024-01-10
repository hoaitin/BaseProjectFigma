//
//  ContryTableViewCell.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 27/12/2023.
//  Copyright © 2023 Vulcan Labs. All rights reserved.
//

import UIKit

class ContryTableViewCell: UITableViewCell {
    static var identifier = "ContryTableViewCell"
    public lazy var contryImage = UIImageView()
    public lazy var nameContryLabel = UILabel()
    public lazy var isLikeButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {                                                 
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(country : Country){
        ConvertUilt.shared.loadImage(from: country.flags.png ) { [weak self] (result) in
                   // Xử lý kết quả
                   switch result {
                   case .success(let image):
                       // Cập nhật giao diện người dùng trên luồng chính với hình ảnh nhận được
                       DispatchQueue.main.async {
                           self?.contryImage.image = image
                       }
                   case .failure(let error):
                       // Xử lý lỗi (nếu cần)
                       print("Error: \(error.localizedDescription)")
                   }
               }
        nameContryLabel.text = country.name.common
        
        if UserDefaults.standard.object(forKey: Configs.countriesUD) != nil {
            let jsonDecoder = JSONDecoder()
            if let storedData = UserDefaults.standard.data(forKey: Configs.countriesUD),
               let decodedCountry = try? jsonDecoder.decode([Country].self, from: storedData) {
                let  isContryArray = decodedCountry.contains(where: {$0.id.png == country.id.png})
                if isContryArray {
                    isLikeButton.setImage(UIImage(named: "icon-heart-red"), for: .normal)
                }else{
                    isLikeButton.setImage(UIImage(named: "icon-heart"), for: .normal)
                }
            }
        } else {
            isLikeButton.setImage(UIImage(named: "icon-heart"), for: .normal)
        }
    }
    
    func setUpViews(){
        contryImage.contentMode = .scaleAspectFit
        contryImage.layer.cornerRadius = 10
        
        nameContryLabel.textColor = .black
        nameContryLabel.font = UIFont.systemFont(ofSize: 16)
        
    }
    
    func setUpConstraints(){
        self.contentView.addSubview(contryImage)
        self.contentView.addSubview(nameContryLabel)
        self.contentView.addSubview(isLikeButton)
        
        contryImage.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leftMargin.equalToSuperview().offset(10)
            $0.size.equalTo(CGSize(width: 80, height: 60))
        }
        
        nameContryLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(contryImage.snp.trailing).offset(20)
            $0.size.equalTo(CGSize(width: 200, height: 40))
        }
        
        isLikeButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.rightMargin.equalToSuperview()
            $0.size.equalTo(CGSize(width: 25, height: 25))
        }
        
    }
}
