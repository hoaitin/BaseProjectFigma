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
    private lazy var searchTF = UITextField()
    private lazy var countriesTable = UITableView()
    private lazy var activityIndicator = UIActivityIndicatorView()
    private var countries: [Country] = []
    private var dataCountries:[Country] = []
     var delegateCountry: DelegateCountry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        setUpConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        BaseRequestService.share.requestApiContry(activityIndicator: activityIndicator){
            (isSuccess,data,code) in
            if(isSuccess){
                self.countries = (data as? [Country])!
                self.dataCountries = (data as? [Country])!
                self.countriesTable.reloadData()
             
            }else{
                self.showErrorMessageAlert(message: code ?? "")
            }
            
        }
    }
    
    func setUpViews(){
        view.backgroundColor  = .white
        
        backViewButton.setTitle("Back", for: .normal)
        backViewButton.setTitleColor( UIColor.black, for: .normal)
        backViewButton.setImage(UIImage(named: "icon_left"), for: .normal)
        backViewButton.imageView?.contentMode = .scaleAspectFit
        backViewButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
        backViewButton.addTarget(self, action: #selector(handleClickBackViewButton), for: .touchUpInside)
        
        activityIndicator.color = .red
        activityIndicator.style = .large
        
        searchTF.placeholder = "search country"
        searchTF.borderStyle = .roundedRect
        searchTF.layer.cornerRadius = 20
        searchTF.layer.borderColor = UIColor.gray.withAlphaComponent(0.7).cgColor
        searchTF.layer.borderWidth = 1
        let iconView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let iconImageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
        iconImageView.image = UIImage(named: "icon-search")
        iconView.addSubview(iconImageView)
        searchTF.rightView = iconView
        searchTF.rightViewMode = .always
        searchTF.addTarget(self, action: #selector(onChangeSearch(_: )), for: .editingChanged)
    
        titleLabel.text = "Countries"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 32)
        
        setContriesTableView()
        
    }
    
    @objc func onChangeSearch(_ textField: UITextField){
        if let searchText = textField.text{
            if(searchText.isEmpty){
                self.countries = self.dataCountries
                self.countriesTable.reloadData()
            }else{
                let dataContriesSearch = self.dataCountries.filter{$0.name.common.contains(searchText)}
                self.countries = dataContriesSearch
                self.countriesTable.reloadData()
            }
        }
    }
    
    func setUpConstraints() {
        view.addSubview(backViewButton)
        view.addSubview(titleLabel)
        view.addSubview(countriesTable)
        view.addSubview(searchTF)
        view.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(100)
        }
        
        backViewButton.snp.makeConstraints{
            $0.topMargin.equalToSuperview().offset(20)
            $0.leftMargin.equalToSuperview().offset(20)
            $0.size.equalTo(CGSize(width: 80, height: 40))
        }
       
        titleLabel.snp.makeConstraints{
            $0.topMargin.equalToSuperview().offset(160)
            $0.leftMargin.equalToSuperview().offset(20)
            $0.size.equalTo(CGSize(width: 200, height: 40))
            
        }
        searchTF.snp.makeConstraints{
            $0.topMargin.equalToSuperview().offset(80)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: view.frame.width - 40, height: 40))
            
        }
        countriesTable.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.size.equalTo(CGSize(width: view.frame.width - 40, height: 500))      
        }
        
    }
    
    @objc func handleClickBackViewButton(){
        navigationController?.popViewController(animated: true)
    }
    
    func showErrorMessageAlert(message: String) {
           let alert = UIAlertController(title: "Notice", message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alert.addAction(okAction)
           present(alert, animated: true, completion: nil)
    }

}

extension ContriesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContryTableViewCell.identifier, for: indexPath) as? ContryTableViewCell else{
            return .init()
        }
        
        let country = countries[indexPath.row]
        cell.isLikeButton.addTarget(self, action: #selector(handleClickLike(_ :)), for: .touchUpInside)
        cell.isLikeButton.tag = indexPath.row
        cell.setData(country: country)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countries[indexPath.row]
        delegateCountry?.getWeatherbyContry(lat: country.latlng[0], lon: country.latlng[1])
        navigationController?.popViewController(animated: true)
    }
    
    func setContriesTableView(){
        countriesTable.dataSource = self
        countriesTable.delegate = self
        countriesTable.backgroundColor = .white
        countriesTable.layer.borderWidth = 1
        countriesTable.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        countriesTable.layer.cornerRadius = 10
        countriesTable.layer.cornerRadius = 10
        countriesTable.register(ContryTableViewCell.self, forCellReuseIdentifier: ContryTableViewCell.identifier)
    }
 
    @objc func handleClickLike(_ sender: UIButton){
        let row = sender.tag
        var country: Country = countries[row]
        CountriesViewModel.share.handleClickCountryLike(sender, country: country)
            
    }
    
}
