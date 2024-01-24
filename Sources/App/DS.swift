//
//  DS.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 23/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation
struct DS: Codable {
    let version: String
    let time: Int
    
    enum CodingKeys: String, CodingKey {
           case version
           case time = "time_show_button"
       }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.version = try container.decode(String.self, forKey: .version)
        self.time = try container.decode(Int.self, forKey: .time)
    }
}
