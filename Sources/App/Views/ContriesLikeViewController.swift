//
//  ContriesLikeViewController.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 25/12/2023.
//  Copyright © 2023 Vulcan Labs. All rights reserved.
//

import UIKit

class ContriesLikeViewController: UIViewController {

    private lazy var backViewButton = UIButton()
    private lazy var titleLabel = UILabel()
    private lazy var contriesTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        setUpConstraints()
        
    }
    
    func setUpViews(){
        view.backgroundColor  = .white
   
        backViewButton.setTitle("Back", for: .normal)
        
        backViewButton.setTitleColor( UIColor.systemBlue, for: .normal)
        backViewButton.addTarget(self, action: #selector(handleClickBackViewButton), for: .touchUpInside)
        
        titleLabel.text = "Contries"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 32)
        
        setContriesTableView()
        
        
        
    }
    
    func setUpConstraints() {
        view.addSubview(backViewButton)
        view.addSubview(titleLabel)
        view.addSubview(contriesTable)
        
        backViewButton.snp.makeConstraints{
            $0.topMargin.equalToSuperview().offset(20)
            $0.leftMargin.equalToSuperview().offset(20)
            $0.size.equalTo(CGSize(width: 200, height: 40))
        }
        
        titleLabel.snp.makeConstraints{
            $0.topMargin.equalToSuperview().offset(80)
            $0.leftMargin.equalToSuperview().offset(20)
            $0.size.equalTo(CGSize(width: 200, height: 40))
            
        }
        
        contriesTable.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.size.equalTo(CGSize(width: view.frame.width - 40, height: 500))
        }
        
    }
    @objc func handleClickBackViewButton(){
        
        navigationController?.popViewController(animated: true)
        
    }




}
extension ContriesLikeViewController{
    func setContriesTableView(){
        
        contriesTable.backgroundColor = .black.withAlphaComponent(0.2)
        contriesTable.layer.cornerRadius = 10
    }}
