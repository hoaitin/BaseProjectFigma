//
//  Configs.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 26/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation
import UIKit

struct Configs{
    static let isHasNortch: Bool = {
            let size = UIScreen.main.bounds.size
            return size.width / size.height < 375.0 / 667.0
        }()
}

enum Onboarding: String {
    case onboarding_v1
    case onboarding_v2
}

enum Directstore: String {
    case directstore_ver1
    case directstore_ver2
}
