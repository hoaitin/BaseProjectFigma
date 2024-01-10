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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
        setUpConstraints()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(contry : Contry){
       
        ConvertUilt.shared.loadImage(from: contry.flags.png ) { [weak self] (result) in
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
        nameContryLabel.text = contry.name.common
        
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
        
        
    }
}
