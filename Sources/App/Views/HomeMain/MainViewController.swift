import UIKit
import SnapKit
import CoreLocation
import Photos
import DGActivityIndicatorView

class MainViewController: UIViewController{
    private lazy var backgroundImageView = UIImageView()
    private lazy var textLabel = UILabel()
    private lazy var bannerTimeImage = UIImageView()
    private lazy var headerView = UIView()
    private lazy var menuLeftButton = UIButton()
    private lazy var kingButton = UIButton()
    private lazy var downloadButton = UIButton()
    private lazy var refreshButton = UIButton()
    private lazy var categoriesCollectionView = UICollectionView()
    private var categories: [CategoryItem] = []
    private lazy var categoriesView = UIView()
    private lazy var activityIndicator = DGActivityIndicatorView()
    private var category: CategoryItem?
    private var imageitem: ImageItem?
    var shouldPerformViewDidAppear = true
    private var selectedIndexPath: IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ConfigColor.main_bg
        
        setUpViews()
        setUpConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if shouldPerformViewDidAppear {
            if let data = RequestApi.share.getApiCategories(jsonString: FileJson.json){
                loadData(data: data)
            }else{
                self.showErrorMessageAlert(message: "no network")
            }
        }
        shouldPerformViewDidAppear = false
    }

    func setUpViews() {
        backgroundImageView.image = UIImage(named: "background-main")
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
        
        refreshButton.setImage(UIImage(named: "icon_refresh"), for: .normal)
        refreshButton.imageView?.contentMode = .scaleAspectFit
        refreshButton.addTarget(self, action: #selector(handleShuffle), for: .touchUpInside)
        
        downloadButton.setImage(UIImage(named: "icon_down"), for: .normal)
        downloadButton.imageView?.contentMode = .scaleAspectFit
        downloadButton.addTarget(self, action: #selector(downloadImage), for: .touchUpInside)
        
        categoriesView.layer.addSublayer(UiltFormat.share.setGrandientShowdow(yourWidth: Int(view.frame.width), yourHeight: 221,y: 0))
        setCategoriesCollection()
        
        activityIndicator.type = .ballSpinFadeLoader
        activityIndicator.tintColor = UIColor(hex: 0x4ABEFE)
        activityIndicator.size = 70
        
        let clickTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
        clickTapGesture.numberOfTapsRequired = 1
        clickTapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(clickTapGesture)
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeLeftGesture.direction = .left
        view.addGestureRecognizer(swipeLeftGesture)

        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeRightGesture.direction = .right
        view.addGestureRecognizer(swipeRightGesture)
    
    }
    
    func loadData(data: [CategoryItem]){
        categories = data
        category = categories.first
        self.bannerTimeImage.isHidden = true
        self.textLabel.isHidden = true
        if let  imageItem = self.category?.randomImage(){
            self.imageitem = imageItem
            MainViewModel.share.loadImage(imageItem: imageItem, backgroundImageView: backgroundImageView)
        }
        selectedIndexPath = IndexPath(item: 0, section: 0)
        categoriesCollectionView.reloadData()
      
    }
    
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
            $0.top.equalToSuperview().offset(40)
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
            $0.right.equalToSuperview().offset(-10)
        }
        
        refreshButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: 40, height: 40))
            $0.trailing.equalTo(downloadButton.snp.leading).offset(5)
        }
        
        categoriesView.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.size.equalTo(CGSize(width: view.frame.width, height: 221))
        }
        
        categoriesCollectionView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(50)
            $0.left.equalToSuperview()
            $0.width.equalToSuperview().offset(-14)
            $0.height.equalTo(150)
        }
    }
    
    @objc func handleDoubleTap(_ gesture: UITapGestureRecognizer) {
            // Xác định tọa độ của double click
            let location = gesture.location(in: view)
        
        if location.y > 100 && location.y < UIScreen.main.bounds.height - 221 {
                // Thực hiện animation để hiển thị hoặc ẩn collectionView
                UIView.animate(withDuration: 0.9) {
                    if self.categoriesView.frame.origin.y == UIScreen.main.bounds.height {
                        self.categoriesView.frame.origin.y -= 221
                    } else {
                        self.categoriesView.frame.origin.y = UIScreen.main.bounds.height
                    }
                }
            }
        }
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
            if gesture.direction == .left {
                activityIndicator.startAnimating()
                if let image = self.imageitem {
                    if let  imageItem = self.category?.backImage(imageItem: image){
                        self.imageitem = imageItem
                        MainViewModel.share.loadImage(imageItem: imageItem, backgroundImageView: backgroundImageView)
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.activityIndicator.stopAnimating()
                }
            } else if gesture.direction == .right {
                activityIndicator.startAnimating()
                if let image = self.imageitem {
                    if let  imageItem = self.category?.nextImage(imageItem: image){
                        self.imageitem = imageItem
                        MainViewModel.share.loadImage(imageItem: imageItem, backgroundImageView: backgroundImageView)
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    
    @objc func nextSettting(){
        let view = SettingViewController()
        navigationController?.pushViewController(view, animated: true)
    }
  
    @objc func nextDS(){
        let view = DSViewController()
        view.modalPresentationStyle = .fullScreen
        present(view, animated: true)
    }
    
    @objc func handleShuffle(){
        category?.shuffleListImage()
        if let  imageItem = self.category?.randomImage(){
            self.imageitem = imageItem
            activityIndicator.startAnimating()
            MainViewModel.share.loadImage(imageItem: imageItem, backgroundImageView: backgroundImageView)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    @objc func downloadImage(){
        UiltFormat.share.loadImage(from: self.imageitem?.linkImage ?? ""  ) { [weak self] (result) in
                   // Xử lý kết quả
                   switch result {
                   case .success(let image):
                       UIImageWriteToSavedPhotosAlbum(image, self, #selector(self!.image(_:didFinishSavingWithError:contextInfo:)), nil)
                   case .failure(let error):
                       // Xử lý lỗi (nếu cần)
                       print("Error: \(error.localizedDescription)")
                   }
        }
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
           let alert = UIAlertController(title: "Notice", message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alert.addAction(okAction)
           present(alert, animated: true, completion: nil)
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
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
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
                }
              
            }
        }
        // Lấy ra cell mới được chọn và thay đổi màu chữ của text
        if let newSelectedCell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
            if newSelectedCell.isSelected {
                let category = categories[indexPath.item]
                self.category = category
                if let  imageItem = self.category?.randomImage(){
                    self.imageitem = imageItem
                    activityIndicator.startAnimating()
                    MainViewModel.share.loadImage(imageItem: imageItem, backgroundImageView: backgroundImageView)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.activityIndicator.stopAnimating()
                    }
                }
                newSelectedCell.setAction() // Hoặc màu chữ bạn muốn sử dụng
            }
        }
      
        selectedIndexPath = indexPath
        
    }
    
}
