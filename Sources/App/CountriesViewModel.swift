//
//  CountriesViewModel.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 03/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation
import UIKit

class CountriesViewModel{
    public static var share:CountriesViewModel = CountriesViewModel()
    
    func handleClickCountryLike(_ sender: UIButton, country: Country){
        var data = [country]
        if UserDefaults.standard.object(forKey: Configs.countriesUD) != nil {
            let jsonDecoder = JSONDecoder()
            if let storedData = UserDefaults.standard.data(forKey: Configs.countriesUD),
               var  decodedCountry = try? jsonDecoder.decode([Country].self, from: storedData) {
                let  isContryArray = decodedCountry.contains(where: {$0.id.png == country.id.png})
                if isContryArray {
                    data = decodedCountry.filter { $0.id.png != country.id.png }
                    sender.setImage(UIImage(named: "icon-heart"), for: .normal)
                    
                }else{
                        decodedCountry.append(country)
                        data = decodedCountry
                    sender.setImage(UIImage(named: "icon-heart-red"), for: .normal)
                }
            }
        } else {
      //      encoderContries(encoderContries: [country])
            sender.setImage(UIImage(named: "icon-heart-red"), for: .normal)
        }
       
            encoderContries(encoderContries: data)
        
    }
    
    func encoderContries(encoderContries: [Country]){
        let jsonEncoder = JSONEncoder()
        if let encodedData = try? jsonEncoder.encode(encoderContries) {
            UserDefaults.standard.set(encodedData, forKey:Configs.countriesUD)
        }
    }
    
}
