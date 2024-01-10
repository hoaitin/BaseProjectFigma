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
    private lazy var searchTF = UITextField()
    private lazy var countriesTable = UITableView()
    private lazy var countries: [Country] = []
    var delegateCountry: DelegateCountry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        setUpConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        countries =  CountriesLikeViewModel.share.decoderContries()
        countriesTable.reloadData()
       
    }
    
    func setUpViews(){
        view.backgroundColor  = .white
   
        backViewButton.setTitle("Back", for: .normal)
        backViewButton.setTitleColor( UIColor.black, for: .normal)
        backViewButton.setImage(UIImage(named: "icon_left"), for: .normal)
        backViewButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)  
        backViewButton.imageView?.contentMode = .scaleAspectFit
        backViewButton.addTarget(self, action: #selector(handleClickBackViewButton), for: .touchUpInside)
        
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
    
    func setUpConstraints() {
        view.addSubview(backViewButton)
        view.addSubview(titleLabel)
        view.addSubview(countriesTable)
        view.addSubview(searchTF)
        
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
    
    @objc func onChangeSearch(_ textField: UITextField){
        if let searchText = textField.text{
            if(searchText.isEmpty){
                self.countries = CountriesLikeViewModel.share.decoderContries()
                self.countriesTable.reloadData()
            }else{
                let dataContriesSearch = CountriesLikeViewModel.share.decoderContries().filter{$0.name.common.contains(searchText)}
                self.countries = dataContriesSearch
                self.countriesTable.reloadData()
            }       
        }
        
    }
    
    @objc func handleClickBackViewButton(){
        navigationController?.popViewController(animated: true)
        
    }

}

extension ContriesLikeViewController: UITableViewDelegate, UITableViewDataSource {
 
    func setContriesTableView(){
        countriesTable.dataSource = self
        countriesTable.delegate = self
        countriesTable.register(CountryLikeTableViewCell.self, forCellReuseIdentifier: CountryLikeTableViewCell.identifier)
        countriesTable.backgroundColor = .white
        countriesTable.layer.borderWidth = 1
        countriesTable.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        countriesTable.layer.cornerRadius = 10
        countriesTable.layer.cornerRadius = 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryLikeTableViewCell.identifier, for: indexPath) as? CountryLikeTableViewCell else{
            return .init()
        }
        let country = countries[indexPath.row]
        cell.setData(country: country)
        cell.deleteButton.addTarget(self, action: #selector(handleDeleteContryLike(_ :)), for: .touchUpInside)
        cell.deleteButton.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countries[indexPath.row]
        
        delegateCountry?.getWeatherbyContry(lat: country.latlng[0], lon: country.latlng[1])
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleDeleteContryLike(_ sender: UIButton){
        let row = sender.tag
        let country = countries[row]
        countries.removeAll(where: {$0.id.png == country.id.png})
        var data = CountriesLikeViewModel.share.decoderContries()
        data.removeAll(where: {$0.id.png == country.id.png})
        CountriesLikeViewModel.share.encoderContries(encoderContries: data)
        countriesTable.reloadData()
    }
   
}
