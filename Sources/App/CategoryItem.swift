//
//  CategoryItem.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 15/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

struct ImageItem: Codable {
    var id: Int
    var linkImage: String
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.linkImage = try container.decode(String.self, forKey: .linkImage)
    }
    
}

struct CategoryItem: Codable {
    var id: Int
    var nameCategory: String
    var imageCategory: String
    var listImage: [ImageItem]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.nameCategory = try container.decode(String.self, forKey: .nameCategory)
        self.imageCategory = try container.decode(String.self, forKey: .imageCategory)
        self.listImage = try container.decode([ImageItem].self, forKey: .listImage)
    }
    
    func randomImage() ->ImageItem? {
        
        if let image = listImage.randomElement() {
            return image
        }
        return nil
    }
    
    func backImage(imageItem: ImageItem) -> ImageItem? {
        if let index = listImage.firstIndex(where: {$0.linkImage == imageItem.linkImage}){
            if (index < 1){
                let image = listImage[listImage.count - 1]
                return image
            }else {
                let image = listImage[index - 1]
                return image
            }
        }
        return nil
    }
    
    func nextImage(imageItem: ImageItem) -> ImageItem? {
        if let index = listImage.firstIndex(where: {$0.linkImage == imageItem.linkImage}){
            if (index < listImage.count - 1){
                let image = listImage[index + 1]
                return image
            }else {
                let image = listImage[0]
                return image
            }
        }
        return nil
    }
    
    mutating func shuffleListImage(){
        listImage.shuffle()
    }
    
}
