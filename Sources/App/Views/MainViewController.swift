import UIKit
import SnapKit
import CoreLocation

class MainViewController: UIViewController, DelegateCountry{
      var locationManager = CLLocationManager()
      private lazy var titleLabel = UILabel()
      private lazy var changeFLabel = UILabel()
      private lazy var changeCLabel = UILabel()
      private lazy var itemMainView = UIView()
      private lazy var itemImage = UIImageView()
      private lazy var activityIndicator = UIActivityIndicatorView()
      private lazy var itemTextLabel = UILabel()
      private lazy var weathersColletionView = UICollectionView()
      private lazy var changeContryButton = UIButton()
      private lazy var iconLikeImage = UIImageView()
      private lazy var iconRefreshButton = UIButton()
      private lazy var daysWeather:[DayWeather] = []
      private var latlng:[Double] = [0,0]
      private var isC = true
      private var weatherData: WeatherData?
      private lazy var weatherDayTableView = UITableView()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestLocationAuthorization()
        setUpViews()
        setUpConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func loadData(){
        self.titleLabel.text = self.daysWeather[0].contry
        self.itemImage.image = UIImage(named: self.daysWeather[0].getWeatherCurrent()?.weather[0].icon ?? "04d")
      
        self.weathersColletionView.reloadData()
        self.weatherDayTableView.reloadData()

        changeCLabel.textColor = isC ? .red : .white
        changeFLabel.textColor = isC ? .white : .red
        self.itemTextLabel.text = isC ? weatherData?.getTemperatureC():
        weatherData?.getTemperatureF()
    }
    
    func setGrandientLayer(yourWidth: Int ,yourHeight : Int)-> CAGradientLayer {
        // Tạo một gradient layer
        let gradientLayer = CAGradientLayer()        // Đặt màu cho gradient
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.white.cgColor]

        // Đặt điểm bắt đầu và kết thúc của gradient
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)

        // Đặt frame cho gradient layer (đối với ví dụ này, chúng ta sẽ đặt full width và height của view)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: yourWidth, height: yourHeight)
        return gradientLayer
    }
    
    func setUpViews() {
        view.layer.addSublayer(setGrandientLayer(yourWidth: Int(view.frame.width),yourHeight: Int(view.frame.height)))
        
        iconLikeImage.image = UIImage(named: "icon-heart")
        iconLikeImage.contentMode = .scaleAspectFit
        iconLikeImage.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleClickNextViewLike))
        iconLikeImage.addGestureRecognizer(tapGestureRecognizer)
        
        activityIndicator.color = .red
        activityIndicator.style = .large
        
        iconRefreshButton.setImage(UIImage(named: "icon-refresh"), for: .normal)
        iconRefreshButton.imageView?.contentMode = .scaleAspectFill
        iconRefreshButton.addTarget(self, action: #selector(handleClickRefresh), for: .touchUpInside)
        
        changeCLabel.text = "°C"
        changeCLabel.font = UIFont.systemFont(ofSize: 24)
        let changeCTapGR = UITapGestureRecognizer(target: self, action: #selector(handleClickChangeC))
        changeCLabel.isUserInteractionEnabled = true
        changeCLabel.addGestureRecognizer(changeCTapGR)
     
        changeFLabel.text = "°F"
        changeFLabel.font = UIFont.systemFont(ofSize: 24)
        let changeFTapGR = UITapGestureRecognizer(target: self, action: #selector(handleClickChangeF))
        changeFLabel.isUserInteractionEnabled = true
        changeFLabel.addGestureRecognizer(changeFTapGR)
        
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 32)
       
        itemImage.contentMode = .scaleAspectFill
        
        itemTextLabel.textColor = .white
        itemTextLabel.textAlignment = .center
        itemTextLabel.font = UIFont.systemFont(ofSize: 32)
        
        changeContryButton.setTitle("Change Country", for: .normal)
        changeContryButton.setTitleColor(UIColor.white, for: .normal)
        changeContryButton.backgroundColor = .blue
        changeContryButton.layer.cornerRadius = 10
        changeContryButton.addTarget(self, action:#selector(handleClickChangeContryButton), for: .touchUpInside)
        
        setWeatherCollectionView()
        setWeatherDateTableView()
        
    }
    
    func setUpConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(itemMainView)
        itemMainView.addSubview(itemImage)
        itemMainView.addSubview(itemTextLabel)
        view.addSubview(weathersColletionView)
        view.addSubview(weatherDayTableView)
        view.addSubview(changeContryButton)
        view.addSubview(iconLikeImage)
        view.addSubview(iconRefreshButton)
        view.addSubview(changeCLabel)
        view.addSubview(changeFLabel)
        view.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(100)
        }
        
        iconRefreshButton.snp.makeConstraints{
            $0.right.equalToSuperview().offset(-20)
            $0.topMargin.equalToSuperview().offset(10)
            $0.size.equalTo(CGSize(width: 25, height: 25))
        }
        
         iconLikeImage.snp.makeConstraints{
            $0.topMargin.equalToSuperview().offset(10)
            $0.size.equalTo(CGSize(width: 25, height: 25))
            $0.trailing.equalTo(iconRefreshButton.snp.leading).offset(-15)
         }
        
         changeFLabel.snp.makeConstraints{
           $0.topMargin.equalToSuperview().offset(10)
           $0.size.equalTo(CGSize(width: 30, height: 25))
           $0.trailing.equalTo(iconLikeImage.snp.leading).offset(-15)
        }
        
        changeCLabel.snp.makeConstraints{
          $0.topMargin.equalToSuperview().offset(10)
          $0.size.equalTo(CGSize(width: 30, height: 25))
          $0.trailing.equalTo(changeFLabel.snp.leading).offset(-15)
        }
        
        titleLabel.snp.makeConstraints{
            $0.topMargin.equalToSuperview().offset(50)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 200, height: 40))
        }
        
        itemMainView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.size.equalTo(CGSize(width: 200, height: 140))
        }
        
        itemImage.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 80, height: 80))
        }
        
        itemTextLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(itemImage.snp.bottom).offset(10)
            $0.size.equalTo(CGSize(width: 100, height: 30))
        }
        
        weathersColletionView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(itemMainView.snp.bottom).offset(5)
            $0.size.equalTo(CGSize(width: view.frame.width - 40, height: 160))
        }
        
        weatherDayTableView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(weathersColletionView.snp.bottom).offset(10)
            $0.size.equalTo(CGSize(width: view.frame.width - 40, height:200))
        }
        
        changeContryButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(weatherDayTableView.snp.bottom).offset(20)
            $0.size.equalTo(CGSize(width: view.frame.width - 40,height: 60))
        }
     
    }
    func getWeatherbyContry(lat: Double, lon: Double) {
        latlng[0] = lat
        latlng[1] = lon
        
        self.getDataToApiWeather(lat: lat, lon: lon, activityIndicator: activityIndicator)
    }
    
    @objc func handleClickRefresh(){
        if latlng[0] != 0 && latlng[1] != 0 {
            self.getDataToApiWeather(lat: latlng[0], lon: latlng[1], activityIndicator: activityIndicator)
        }else{
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func handleClickChangeContryButton(){
        let view = ContriesViewController()
        view.delegateCountry = self
        navigationController?.pushViewController(view, animated: true)
    }
    
    @objc func handleClickNextViewLike(){
        let view = ContriesLikeViewController()
        view.delegateCountry = self
        navigationController?.pushViewController(view, animated: true)
    }
    
    @objc func handleClickChangeC(){
        self.isC = true
        self.loadData()
    }
    
    @objc func handleClickChangeF(){
        self.isC = false
        self.loadData()
    }
    
    func showErrorMessageAlert(message: String) {
           let alert = UIAlertController(title: "Notice", message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alert.addAction(okAction)
           present(alert, animated: true, completion: nil)
    }

}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let firstDayWeather = daysWeather.first {
            return firstDayWeather.weatherData.count
        } else {
            return 0
        }
    }
    
    func setWeatherCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: 80, height: 150)
        weathersColletionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        self.weathersColletionView.dataSource = self
        self.weathersColletionView.delegate = self
        weathersColletionView.register(WeatherViewCell.self, forCellWithReuseIdentifier: WeatherViewCell.id)
        weathersColletionView.layer.cornerRadius = 10
        weathersColletionView.backgroundColor = .black.withAlphaComponent(0.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"WeatherViewCell", for: indexPath) as? WeatherViewCell else{
            return .init()
        }
        let weather: WeatherData = daysWeather[0].sortWeatherData()[indexPath.row]
        cell.setData(weatherData: weather,isC: isC)
        
        return cell
        
    }
    
}

extension MainViewController:UITableViewDelegate,UITableViewDataSource{
    func setWeatherDateTableView(){
        weatherDayTableView.dataSource = self
        weatherDayTableView.delegate = self
        weatherDayTableView.register(WeatherDataTableViewCell.self, forCellReuseIdentifier: WeatherDataTableViewCell.identifier)
        weatherDayTableView.layer.cornerRadius = 10
        weatherDayTableView.backgroundColor = .black.withAlphaComponent(0.2)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDataTableViewCell.identifier, for: indexPath) as? WeatherDataTableViewCell else{
            return .init()
        } 
        let dayWeather = daysWeather[indexPath.row]
        cell.setData(dayWeather: dayWeather,isC: isC)
        
        return cell
    }
    
    func getDataToApiWeather(lat: Double,lon: Double, activityIndicator: UIActivityIndicatorView){
        BaseRequestService.share.requestApiWeather(lat: lat, lon: lon,activityIndicator: activityIndicator){
            (isSuccess,data,code)  in
            DispatchQueue.main.async {
                if(isSuccess){
                    var daysWeatherData = data as? [DayWeather]
                    self.daysWeather = daysWeatherData!.sorted(by: {$0.weatherData[0].dt < $1.weatherData[0].dt});
                    self.weatherData = self.daysWeather[0].getWeatherCurrent()
                    self.loadData()
                }else{
                    self.showErrorMessageAlert(message: code ?? "")
                }
            }
        }
    }
    
}

extension MainViewController: CLLocationManagerDelegate {
    
    func requestLocationAuthorization() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        locationManager.startUpdatingLocation()
//        locationManager.startUpdatingHeading()
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 10.0 // Đơn vị là mét
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.requestLocation()
            locationManager.startUpdatingLocation()
        case .denied, .restricted:
             showLocationDeniedAlert()
            break
        case .notDetermined:
            // Authorization not determined yet
            locationManager.requestWhenInUseAuthorization()
            break
        @unknown default:
            print("error 3")
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        latlng[0] = location.coordinate.latitude
        latlng[1] = location.coordinate.longitude
     
        self.getDataToApiWeather(lat: latlng[0], lon: latlng[1], activityIndicator: activityIndicator)
    }
    
    func showLocationDeniedAlert() {
            let alertController = UIAlertController(
                title: "Location Access Denied",
                message: "To use this feature, please enable location access in Settings.",
                preferredStyle: .alert
            )

            let settingsAction = UIAlertAction(title: "Settings", style: .default) { _ in
                // Mở cài đặt để người dùng có thể cấp quyền truy cập vị trí
                if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(settingsURL)
                }
            }

            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

            alertController.addAction(settingsAction)
            alertController.addAction(cancelAction)

            present(alertController, animated: true, completion: nil)
        }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
    }

}
