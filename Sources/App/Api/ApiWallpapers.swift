//
//  ApiWallpapers.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 17/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation
import FirebaseStorage


class ApiWallpapers{
    public static let share: ApiWallpapers = ApiWallpapers()
    private let folderMain = "wallpapers"
    let storage = Storage.storage()
    
    func getWallpapersByCategory(category: String, completion: @escaping callback){
        
        let path = "/wallpapers/".appending(category)
        
        let storageRef = storage.reference()
        let folderRef = storageRef.child(path)

        // Lấy danh sách tất cả các vật thể trong thư mục
        folderRef.listAll { (result, error) in
            if let error = error {
                // Xử lý lỗi nếu có
                completion(false,nil,"Lỗi khí lấy danh sách")
                print("Lỗi khi lấy danh sách vật thể: \(error.localizedDescription)")
            } else {
                if let result = result {
                    var wallpapers = [String]()
                    for item in result.items {
                        let imageName = item.name
                        wallpapers.append(imageName)
                    }
                    completion(true,wallpapers,"success")
                } else {
                    completion(false,nil,"Không có dữ liệu")
                    
                }
            }
        }
    }
    
    func getWallpaperByName(category: String, name: String , completion: @escaping callback){
        
        let path = "\(self.folderMain)/\(category)/\(name)"
        
        let storageRef = storage.reference()
        let imageRef = storageRef.child(path)

        imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                // Xử lý lỗi nếu có
                completion(false,nil,"Lỗi khi tải ảnh")
                print("Lỗi khi tải ảnh: \(error.localizedDescription)")
            } else {
                if let imageData = data {
                    completion(true, imageData, "success")
                } else {
                    completion(false,nil,"Dữ liệu hình ảnh không hợp lệ.")
                    print("Dữ liệu hình ảnh không hợp lệ.")
                }
            }
        }
    }
    
}
