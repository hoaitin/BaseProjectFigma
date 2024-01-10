//
//  CountriesLikeViewModel.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 04/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation
class CountriesLikeViewModel{
    public static var share:CountriesLikeViewModel = CountriesLikeViewModel()
    
    func encoderContries(encoderContries: [Country]){
        let jsonEncoder = JSONEncoder()
        if let encodedData = try? jsonEncoder.encode(encoderContries) {
            UserDefaults.standard.set(encodedData, forKey:Configs.countriesUD)
        }
    }
    func decoderContries() -> [Country]{
        var countries:[Country] = []
        let jsonDecoder = JSONDecoder()
        if let storedData = UserDefaults.standard.data(forKey: Configs.countriesUD),
           let decodedCountry = try? jsonDecoder.decode([Country].self, from: storedData) {
            countries =  decodedCountry
        }
        return countries
    }
}
