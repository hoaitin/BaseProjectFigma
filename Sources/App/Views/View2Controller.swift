//
//  View2Controller.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 26/12/2023.
//  Copyright © 2023 Vulcan Labs. All rights reserved.
//

import UIKit

class View2Controller: UIViewController {
    private lazy var nextButton = UIButton()
    private lazy var titleLabel = UITextField()

 
     var demo: Demo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setViews()

        // Do any additional setup after loading the view.
    }
    
    func setViews(){
        view.addSubview(nextButton)
        view.addSubview(titleLabel)
        
        
        titleLabel.placeholder = "nhập ký tự"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 32)
        titleLabel.borderStyle = .roundedRect
        titleLabel.layer.borderColor = UIColor.black.cgColor
        
        nextButton.setTitle("back", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = .blue
        nextButton.addTarget(self, action: #selector(handlebackButton), for: .touchUpInside)
        
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
    
    @objc func handlebackButton(){
        let value = titleLabel.text ?? ""
        demo?.demoDelegate(value: value)
        navigationController?.popViewController(animated: true)
    }

}
