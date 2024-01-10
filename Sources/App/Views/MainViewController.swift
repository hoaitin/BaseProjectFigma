import UIKit
import SnapKit
import CoreLocation

class MainViewController: UIViewController{
    private lazy var backgroundImageView = UIImageView()
    private lazy var headerView = UIView()
    private lazy var menuLeftButton = UIButton()
    private lazy var kingButton = UIButton()
    private lazy var downloadButton = UIButton()
    private lazy var refreshButton = UIButton()
    private lazy var textLabel = UILabel()
    var initialTouchPoint: CGPoint = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        backgroundImageView.image = UIImage(named: "background-main");
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
     
        menuLeftButton.setImage(UIImage(named: "icon_menu"), for: .normal)
        menuLeftButton.imageView?.contentMode = .scaleAspectFit
        
        kingButton.setImage(UIImage(named: "icon_king"), for: .normal)
        kingButton.imageView?.contentMode = .scaleAspectFit
        
        refreshButton.setImage(UIImage(named: "icon_refresh"), for: .normal)
        refreshButton.imageView?.contentMode = .scaleAspectFit
        
        downloadButton.setImage(UIImage(named: "icon_down"), for: .normal)
        downloadButton.imageView?.contentMode = .scaleAspectFit
        
        textLabel.text = "Swipe left for the next wallpaper"
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        textLabel.font = UIFont(name: "OpenSans-Text", size: 14)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    // Hàm xử lý sự kiện khi người dùng kéo
        @objc func handlePan(gesture: UIPanGestureRecognizer) {
            let translation = gesture.translation(in: view)

            switch gesture.state {
            case .began:
                initialTouchPoint = gesture.location(in: view)
            case .changed:
                if initialTouchPoint.x == 0 {
                    initialTouchPoint = gesture.location(in: view)
                }
                let xOffset = translation.x - initialTouchPoint.x
                backgroundImageView.frame.origin.x = xOffset
            case .ended, .cancelled:
                // Khi kéo kết thúc, kiểm tra vị trí của ảnh
                print(backgroundImageView.frame.origin.x)
                if -backgroundImageView.frame.origin.x > 200 {
                    
                    // Nếu ảnh đã kéo đủ một phần, chuyển đến UIViewController mới
                    let nextViewController = HomeCategoryViewController()
                    navigationController?.pushViewController(nextViewController, animated: true)
                } else {
                    // Ngược lại, reset vị trí của ảnh về ban đầu
                    UIView.animate(withDuration: 0.5) {
                        self.backgroundImageView.frame.origin.x = 0
                    }
                }
            default:
                break
            }
        }
    
    func setUpConstraints() {
        view.addSubview(backgroundImageView)
        view.addSubview(headerView)
        view.addSubview(textLabel)
        headerView.addSubview(menuLeftButton)
        headerView.addSubview(kingButton)
        headerView.addSubview(refreshButton)
        headerView.addSubview(downloadButton)
        
        backgroundImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
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
        
        textLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-34)
            $0.size.equalTo(CGSize(width: view.frame.width - 40, height: 30))
        }
        
    }
//    @objc func handleSwipe(_ gesture: UIPanGestureRecognizer) {
//        if gesture.state == .ended {
//                    // Khi cử chỉ kết thúc, kiểm tra hướng của cử chỉ
//                    let translation = gesture.translation(in: self.view)
//                    if translation.x < 0 {
//                        // Nếu hướng là sang trái, thực hiện xử lý và truyền dữ liệu
//                        let view = HomeCategoryViewController()
//                       navigationController?.pushViewController(view, animated: true)
//                    }
//         }
//         
//       }

}

