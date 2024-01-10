//
//  ContriesViewController.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 25/12/2023.
//  Copyright © 2023 Vulcan Labs. All rights reserved.
//

import UIKit

class ContriesViewController: UIViewController {
    private lazy var backViewButton = UIButton()
    private lazy var titleLabel = UILabel()
    private lazy var contriesTable = UITableView()
    private var contries: [Contry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contries = BaseRequestService.share.requestApiContry()
       
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
extension ContriesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContryTableViewCell.identifier, for: indexPath) as? ContryTableViewCell else{
            return .init()
        }
     
        let contry = contries[indexPath.row]
        cell.setData(contry: contry)
        return cell
    }
    
    func setContriesTableView(){
        contriesTable.dataSource = self
        contriesTable.delegate = self
        contriesTable.backgroundColor = .white
        contriesTable.layer.borderWidth = 1
        contriesTable.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        contriesTable.layer.cornerRadius = 10
        contriesTable.layer.cornerRadius = 10
        contriesTable.register(ContryTableViewCell.self, forCellReuseIdentifier: ContryTableViewCell.identifier)
    }
 
}
