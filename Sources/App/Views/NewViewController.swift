//
//  NewViewController.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 22/12/2023.
//  Copyright © 2023 Vulcan Labs. All rights reserved.
//

import UIKit
import SnapKit
import CoreLocation
class NewViewController: UIViewController , Demo{
    
    private lazy var nextButton = UIButton()
    private lazy var titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
    
        setViews()

        // Do any additional setup after loading the view.
    }
    
    func setViews(){
        view.addSubview(nextButton)
        view.addSubview(titleLabel)
        
        titleLabel.text = "kết quả"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 32)
        
        nextButton.setTitle("next", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = .blue
        nextButton.addTarget(self, action: #selector(handlenextButton), for: .touchUpInside)
        
        titleLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.size.equalTo(CGSize(width: 200, height: 40))
        }
        nextButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.size.equalTo(CGSize(width: 200, height: 40))
        }
    }

    
    @objc func handlenextButton(){
        let view2 = View2Controller()
        view2.demo = self
        navigationController?.pushViewController(view2, animated: true)
    }
    
    func demoDelegate(value: String) {
        titleLabel.text = value
        print("Vào")
    }

  
}
