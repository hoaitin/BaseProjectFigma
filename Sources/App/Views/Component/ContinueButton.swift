//
//  ContineButton.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 05/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import UIKit
class ContinueButton: UIButton {
    var gradientColors: [CGColor] = []

        var titleAlignment: NSTextAlignment = .center {
            didSet {
                titleLabel?.textAlignment = titleAlignment
            }
        }

        override func layoutSubviews() {
            super.layoutSubviews()

            guard let imageView = imageView else { return }

            imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 35), bottom: 5, right: 5)

            // Tùy chỉnh vị trí của titleLabel dựa trên giá trị titleAlignment
            switch titleAlignment {
            case .center:
                titleEdgeInsets = UIEdgeInsets(top: 0, left: -((imageView.bounds.width) + 10), bottom: 0, right: 0 )
            case .left:
                titleEdgeInsets = UIEdgeInsets(top: 0, left: -((imageView.bounds.width + 100 )), bottom: 0, right: 0)
            default:
                break
            }
        }
}

