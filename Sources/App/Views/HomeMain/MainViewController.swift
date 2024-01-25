import UIKit
import SnapKit
import CoreLocation
import Photos
import DGActivityIndicatorView
import Kingfisher
import NVActivityIndicatorView
import RxSwift
import RxCocoa
import Toast_Swift

class MainViewController: UIViewController,Delegate{
    private lazy var backgroundImageView = UIImageView()
    private lazy var textLabel = UILabel()
    private lazy var bannerTimeImage = UIImageView()
    private lazy var headerView = UIView()
    private lazy var menuLeftButton = UIButton()
    private lazy var kingButton = UIButton()
    private lazy var downloadButton = UIButton()
    private lazy var refreshButton = UIButton()
    private lazy var categoriesCollectionView = UICollectionView()
    private lazy var categoriesView = UIView()
    private lazy var alert = UIAlertController()
    private lazy var activityIndicator = NVActivityIndicatorView( frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    private lazy var centerButton = UIButton()
    
    private var categories: [CategoryItem] = []
    private var category: CategoryItem?
    private var listImage:[String] = []
    private var image:String?
    private var shouldPerformViewDidAppear = true
    private var selectedIndexPath: IndexPath?
    private var ds: DS?
    var isShowCate = false
    let disP = DisposeBag()
    private let apiWallpapers = ApiWallpapers.share
    private let anilytics = AnalyticsManager.share
    var isPurchase  = UserDefaults.standard.bool(forKey: ConfigKey.isPurchase)
    let userDefaults = UserDefaults.standard
    var freeUsage: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ConfigColor.main_bg
        
        setUpViews()
        setUpConstraints()
        setupRx()
        getData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard shouldPerformViewDidAppear else { return }
        shouldPerformViewDidAppear = false
        
        if let categoriesData = UserDefaults.standard.data(forKey: "categories") {
            do {
                  let decoder = JSONDecoder()
                  let loadedCategoryItem = try decoder.decode([CategoryItem].self, from: categoriesData)
                   self.loadData(data: loadedCategoryItem)
              } catch {
                  showErrorMessageAlert(message: "error not data")
              }
        }
    }

    func setUpViews() {
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        
        textLabel.text = "Swipe left for the next wallpaper"
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        textLabel.font = UIFont(name: "OpenSans-Text", size: 14)
       
        
        bannerTimeImage.image = UIImage(named: "banner_time")
        bannerTimeImage.contentMode = .scaleAspectFill
        
        menuLeftButton.setImage(UIImage(named: "icon_menu"), for: .normal)
        menuLeftButton.imageView?.contentMode = .scaleAspectFit
        menuLeftButton.addTarget(self, action: #selector(nextSettting), for: .touchUpInside)
        
        kingButton.setImage(UIImage(named: "icon_king"), for: .normal)
        kingButton.imageView?.contentMode = .scaleAspectFit
        kingButton.addTarget(self, action: #selector(nextDS), for: .touchUpInside)
    
        if(isPurchase){
            kingButton.isHidden = true
        }
        
        refreshButton.setImage(UIImage(named: "icon_refresh"), for: .normal)
        refreshButton.imageView?.contentMode = .scaleAspectFit
        refreshButton.addTarget(self, action: #selector(handleShuffle), for: .touchUpInside)
        
        downloadButton.setImage(UIImage(named: "icon_down"), for: .normal)
        downloadButton.imageView?.contentMode = .scaleAspectFit
        downloadButton.addTarget(self, action: #selector(downloadImage), for: .touchUpInside)
        
        categoriesView.layer.addSublayer(UiltFormat.share.setGrandientShowdow(yourWidth: Int(view.frame.width), yourHeight: 221,y: 0))
        setCategoriesCollection()
        
        activityIndicator.type = .ballSpinFadeLoader
        activityIndicator.color = UIColor(hex: 0x4ABEFE)
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeLeftGesture.direction = .left
        view.addGestureRecognizer(swipeLeftGesture)

        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeRightGesture.direction = .right
        view.addGestureRecognizer(swipeRightGesture)
    
    }
    
    // constraint
    
    func setUpConstraints() {
        view.addSubview(backgroundImageView)
        view.addSubview(bannerTimeImage)

        view.addSubview(textLabel)
        view.addSubview(headerView)
        view.addSubview(categoriesView)
        view.addSubview(activityIndicator)
        
        categoriesView.addSubview(categoriesCollectionView)
        
        headerView.addSubview(menuLeftButton)
        headerView.addSubview(kingButton)
        headerView.addSubview(refreshButton)
        headerView.addSubview(downloadButton)
        
        view.addSubview(centerButton)
        
        centerButton.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.size.equalTo(CGSize(width: 200, height: 450))
        }
        
        backgroundImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        textLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-34)
            $0.size.equalTo(CGSize(width: view.frame.width - 40, height: 30))
        }
        
        bannerTimeImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(90)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 214, height: 105))
        }
        
        headerView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(47)
            $0.size.equalTo(CGSize(width: view.frame.width, height: 40))
        }
        
        menuLeftButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        kingButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.equalTo(menuLeftButton.snp.right).offset(5)
            $0.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        downloadButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: 40, height: 40))
            $0.right.equalToSuperview().offset(-20)
        }
        
        refreshButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: 40, height: 40))
            $0.trailing.equalTo(downloadButton.snp.leading).offset(5)
        }
        
        categoriesView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(221)
            $0.bottom.equalToSuperview().inset(0)
        }
        
        categoriesCollectionView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
            $0.bottom.equalToSuperview().offset(-16)
        }
    }
    
    // set RX
    func setupRx() {
        centerButton.rx.tap
            .withUnretained(self)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { owner, _ in
                owner.isShowCate = !owner.isShowCate
                owner.stateCategory(isShow: owner.isShowCate)
            })
            .disposed(by: disP)
            
    }
    // another

    func stateCategory(isShow: Bool) {
      
        categoriesView.snp.updateConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(221)
            $0.bottom.equalToSuperview().inset(isShowCate ? 0 : -221)
        }
        
        UIView.animate(withDuration: TimeInterval(1.5)) {
            self.view.layoutIfNeeded()
      
        }
       
    }
    
    func loadData(data: [CategoryItem]){
        categories = data
        category = categories.first
        self.loadImage()
        selectedIndexPath = IndexPath(item: 0, section: 0)
        DispatchQueue.main.async {
            self.categoriesCollectionView.reloadData()
        }
    }
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .left:
            if !self.listImage.isEmpty , let image = self.image {
                if let  imageItem = MainViewModel.share.backImage(imageItem: image, listImage: self.listImage){
                    self.isShowCate = false
                    stateCategory(isShow: false)
                    self.image = imageItem
                    self.getImage(image: imageItem)
                    
                }
            }
        case .right:
            if !self.listImage.isEmpty , let image = self.image {
                if let  imageItem = MainViewModel.share.nextImage(imageItem: image, listImage: self.listImage){
                    self.image = imageItem
                    self.getImage(image: imageItem)
                    self.isShowCate = false
                    stateCategory(isShow: false)
                }
            }
        default:
            print("Value is something else")
        }
        
    }
    
    @objc func nextSettting(){
        let view = Settings2ViewController()
        navigationController?.pushViewController(view, animated: true)
    }
  
    @objc func nextDS(){
        self.selectViewDS()
    }
    
    func selectViewDS(){
        guard let dsData = self.ds else { return }
        switch dsData.version {
        case "directstore_ver1" :
            var view = DSViewController()
            view.modalPresentationStyle = .fullScreen
            view.delegate = self
            present(view, animated: true)
        case "directstore_ver2" :
           var view = DS2ViewController()
            view.modalPresentationStyle = .fullScreen
            view.delegate = self
            present(view, animated: true)
        default: break
        }
    }
    
    @objc func handleShuffle(){
        self.shuffleListImage()
        if !self.listImage.isEmpty {
            if let  imageItem = MainViewModel.share.randomImage(images: listImage, imageOld: self.image ?? ""){
                self.image = imageItem
                self.getImage(image: imageItem)
            }
        }
    }
    
    @objc func downloadImage(){
        var numberOfDownloads = userDefaults.integer(forKey: "number_of_downloads")
        if self.isPurchase || (numberOfDownloads < (self.freeUsage ?? 0)) {
            if numberOfDownloads < (self.freeUsage ?? 0) {
                numberOfDownloads += 1
                print("===============>\(numberOfDownloads)" )
                userDefaults.setValue(numberOfDownloads, forKey: "number_of_downloads")
            }
            
            if let nameImage = self.image {
                apiWallpapers.getWallpaperByName(category: self.category!.id, name: nameImage){
                    (isSuccess,data,message) in
                    if(isSuccess){
                        self.anilytics.logEvent(name: "click_download_image",parameters: ["nameImage": nameImage])
                        if let imageView = UIImage(data: data as! Data) {
                            UIImageWriteToSavedPhotosAlbum(imageView, self, #selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
                        }
                    }else{
                        self.activityIndicator.stopAnimating()
                        self.showErrorMessageAlert(message: message ?? "")
                    }
                }
            }
        }else {
            self.selectViewDS()
        }
    }
    
    func getData(){
        if let ds = userDefaults.data(forKey: "ds") {
            do {
                  let decoder = JSONDecoder()
                  let dsData = try decoder.decode(DS.self, from: ds)
                  self.ds = dsData
                   
              } catch {
                  print("error not data")
              }
        }
        self.freeUsage = userDefaults.integer(forKey: "free_usage")
        
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
       if let error = error {
           // Image save failed with error
           self.showErrorMessageAlert(message: error.localizedDescription)
       } else {
           // Image saved successfully
           self.showErrorMessageAlert(message: "Image saved successfully" )
       }
   }
    
    func showErrorMessageAlert(message: String) {
        self.view.makeToast(message, duration: 3.0, position: .center)
    }
    
    
    func shuffleListImage(){
        self.listImage.shuffle()
    }
    
    func loadImage(){
        if let categoryID = self.category?.id{
            apiWallpapers.getWallpapersByCategory(category: categoryID){
                (isSuccess,data,message) in
                if(isSuccess){
                    if let images = data as? [String]{
                        self.listImage = images
                        self.shuffleListImage()
                        if let nameImage = MainViewModel.share.randomImage(images: images, imageOld: self.image ?? "") {
                            self.image = nameImage
                            self.getImage(image: nameImage)
                        }
                    }
                }else{
                    self.showErrorMessageAlert(message: message ?? "")
                }
            }
        }
    }
    
    func getImage(image: String){
        let isloadImage = MainViewModel.share.isLoadImage(image: image)
        if(!isloadImage){
            activityIndicator.startAnimating()
        }
        if let categoryId = self.category?.id {
            apiWallpapers.getWallpaperByName(category: categoryId, name: image){
                (isSuccess,data,message) in
                if(isSuccess){
                    if let dataImage = data as? Data {
                        self.backgroundImageView.image = UIImage(data: dataImage)
                        if(!isloadImage){
                            self.activityIndicator.stopAnimating()
                        }
                    }
                }else{
                    if(!isloadImage){
                        self.activityIndicator.stopAnimating()
                    }
                    self.showErrorMessageAlert(message: message ?? "")
                }
            }
        }
    }
    
}
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func setCategoriesCollection(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        layout.itemSize = CGSize(width: 100, height: 120)
       
        self.categoriesCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        self.categoriesCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.id)
        self.categoriesCollectionView.showsHorizontalScrollIndicator = false
        self.categoriesCollectionView.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.categoriesCollectionView.dataSource = self
        self.categoriesCollectionView.delegate = self
        if let flowLayout = self.categoriesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.id, for: indexPath) as? CategoryCollectionViewCell else {
            return .init()
        }
        let category = categories[indexPath.item]
        cell.setData(category: category)
        
        if indexPath.item == selectedIndexPath?.item {
            cell.setAction()
        }else{
            cell.hiddenAction()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        // Kiểm tra xem có cell nào được chọn trước đó không
        if let previousSelectedIndexPath = selectedIndexPath {
            if let previousSelectedCell = collectionView.cellForItem(at: previousSelectedIndexPath) as?
                CategoryCollectionViewCell {
                if(!previousSelectedCell.isSelected){
                    previousSelectedCell.hiddenAction()
                    UserDefaults.standard.removeObject(forKey: "images")
                }
              
            }
        }
        // Lấy ra cell mới được chọn và thay đổi màu chữ của text
        if let newSelectedCell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
            if newSelectedCell.isSelected {
                let category = categories[indexPath.item]
                self.category = category
                self.loadImage()
               
                newSelectedCell.setAction() // Hoặc màu chữ bạn muốn sử dụng
            }
        }
      
        selectedIndexPath = indexPath
        
    }
    func isPremium(value: Bool) {
        if value {
            kingButton.isHidden = true
            self.isPurchase = true
        }
    }
    
}

