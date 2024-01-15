//
//  RequestApi.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 11/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation

class RequestApi{
    static var share: RequestApi = RequestApi()
    func getApiCategories(jsonString: String) -> [CategoryItem]? {
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                let decoder = JSONDecoder()
                let categories = try decoder.decode([CategoryItem].self, from: jsonData)
                return categories
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        return nil
    }
}
