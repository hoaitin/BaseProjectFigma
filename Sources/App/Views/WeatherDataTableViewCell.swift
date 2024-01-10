//
//  CategoryCell.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 22/12/2023.
//  Copyright © 2023 Vulcan Labs. All rights reserved.
//

import UIKit

class WeatherDataTableViewCell: UITableViewCell{
    static var identifier = "WeatherDataTableViewCell"
    private lazy var titleDayLabel = UILabel()
    private lazy var iconWeatherImage = UIImageView()
    private lazy var temMinLabel = UILabel()
    private lazy var temMaxLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(dayWeather : DayWeather, isC: Bool){
        titleDayLabel.text = fomatDayWeek(dt: dayWeather.weatherData[0].dt)
        iconWeatherImage.image = UIImage(named: dayWeather.weatherData[0].weather[0].icon)
       
        temMinLabel.text = isC ?dayWeather.getTemperatureCMixOnDay(): dayWeather.getTemperatureFMixOnDay()
        temMaxLabel.text = isC ?dayWeather.getTemperatureCMaxOnDay(): dayWeather.getTemperatureFMaxOnDay()
       
    }
    
    func setUpViews(){
        self.backgroundColor = .black.withAlphaComponent(0.2)
        
        titleDayLabel.textColor = .black
        titleDayLabel.font = UIFont.systemFont(ofSize: 16)
        
        iconWeatherImage.contentMode = .scaleAspectFit
    
        temMinLabel.textColor = .black
        temMinLabel.font = UIFont.systemFont(ofSize: 16)
        
        temMaxLabel.textColor = .black
        temMaxLabel.font = UIFont.systemFont(ofSize: 16)
        
    }
    
    func setUpConstraints() {
        contentView.addSubview(titleDayLabel)
        contentView.addSubview(temMaxLabel)
        contentView.addSubview(temMinLabel)
        contentView.addSubview(iconWeatherImage)
        
        titleDayLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leftMargin.equalToSuperview().offset(10)
            $0.size.equalTo(CGSize(width: 120, height: 40))
        }
        
        iconWeatherImage.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(titleDayLabel.snp.trailing).offset(10)
            $0.size.equalTo(CGSize(width: 40, height: 40))
        }
    
        temMaxLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.rightMargin.equalToSuperview().offset(10)
            $0.size.equalTo(CGSize(width: 80, height: 40))
        }
        temMinLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(temMaxLabel.snp.leading).offset(20)
            $0.size.equalTo(CGSize(width: 80, height: 40))
        }
       
    }
    
    func fomatDayWeek(dt: Int) -> String {
        let timestamp = TimeInterval(dt)
        let date = Date(timeIntervalSince1970: timestamp)

        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: date)

        // Lấy tên của thứ trong ngày
        let dateFormatter = DateFormatter()
        let dayName = dateFormatter.standaloneWeekdaySymbols[dayOfWeek - 1]   
        return dayName
    }
 
    
    
}
