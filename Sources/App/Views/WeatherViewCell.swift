//
//  WeatherViewCell.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 22/12/2023.
//  Copyright © 2023 Vulcan Labs. All rights reserved.
//

import UIKit

class WeatherViewCell: UICollectionViewCell {
    static var id = "WeatherViewCell"
    private lazy var dayLabel = UILabel()
    private lazy var weatherImage = UIImageView()
    private lazy var temperatureLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
        setUpConstraints()
    }
    func setData(weatherData : WeatherData){
        dayLabel.text = weatherData.getTime()
        weatherImage.image = UIImage(named: weatherData.weather[0].icon)
        temperatureLabel.text = weatherData.getTemperatureC()
        
    }
    
    func setUpView(){
        dayLabel.textColor = .black
        dayLabel.textAlignment = .center
        dayLabel.font = UIFont.systemFont(ofSize: 16)
        
        weatherImage.contentMode = .scaleToFill
        
        temperatureLabel.textColor = .black
        temperatureLabel.textAlignment = .center
        temperatureLabel.font = UIFont.systemFont(ofSize: 16)
        
        
        
    }
    func setUpConstraints(){
        contentView.addSubview(dayLabel)
        contentView.addSubview(weatherImage)
        contentView.addSubview(temperatureLabel)
        
        dayLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.topMargin.equalToSuperview().offset(5)
            $0.size.equalTo(CGSize(width: 100, height: 30))
            
        }
        weatherImage.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(dayLabel.snp.bottom).offset(5)
            $0.size.equalTo(CGSize(width: 50, height: 50))
            
        }
        temperatureLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(weatherImage.snp.bottom).offset(5)
            $0.size.equalTo(CGSize(width: 100, height: 30))
            
        }
        
        
        
    }
    
}

