//
//  View1Controller.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 22/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//


import UIKit
import SnapKit
import CoreLocation
import SwiftUI

class View1Controller: UIViewController{
    private lazy var textLabel = UILabel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        view.backgroundColor = ConfigColor.main_bg
        
        textLabel.text = "View 1"
        textLabel.font = .systemFont(ofSize: 20, weight: .bold)
        textLabel.textColor = .white
        
       
    }
    
    func setUpConstraints() {
        view.addSubview(textLabel)
       
        textLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.size.equalTo(CGSize(width: 200, height: 40))
        }
        
    }

}

