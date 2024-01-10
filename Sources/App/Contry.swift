//
//  Contry.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 27/12/2023.
//  Copyright © 2023 Vulcan Labs. All rights reserved.
//

import Foundation

struct Name: Codable {
    var common: String
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.common = try container.decode(String.self, forKey: .common)
    }
}
struct Flags: Codable {
    var png : String
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.png = try container.decode(String.self, forKey: .png)
    }
}

struct Contry: Codable{
    var name : Name
    var latlng: [Double]
    var flags: Flags
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(Name.self, forKey: .name)
        self.latlng = try container.decode([Double].self, forKey: .latlng)
        self.flags = try container.decode(Flags.self, forKey: .flags)
    }
}

