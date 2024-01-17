//
//  CategoryItem.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 15/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

struct ImageItem: Codable {
    let id: Int
    let category_id: Int
    var linkImage: String
    
    init(id: Int, category_id: Int, linkImage: String) {
        self.id = id
        self.category_id = category_id
        self.linkImage = linkImage
    }
    
}

struct CategoryItem: Codable {
    let id: String
    var nameCategory: String
    var imageCategory: String
 
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.nameCategory = try container.decode(String.self, forKey: .nameCategory)
        self.imageCategory = try container.decode(String.self, forKey: .imageCategory)
    }
    
}
