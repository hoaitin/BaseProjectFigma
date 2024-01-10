import Foundation
import SnapKit
import UIKit

class SectionCreationFrom: BaseTableViewCell {
    
    private lazy var titleLabel = UILabel()
    private lazy var featureView = FeatureView()
    
    var tapFeatureText: (() -> Void)?
    var tapFeatureImage: (() -> Void)?
    var tapFeatureDoodle: (() -> Void)?
    var tapFeatureQr: (() -> Void)?
    var tapFeatureChatBot: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        setupRx()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        titleLabel.setText(text: "New Creation From", color: AppColor.whiteTextColor)
        titleLabel.font = UIFont.appFont(size: 20, weight: .Bold)
    }
    
    private func setupConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(featureView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20.scaleX)
        }
        
        featureView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-15.scaleX)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setupRx() {
        
        featureView.featureText.button.rx.tap
            .observe(on: scheduler.main)
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                owner.tapFeatureText?()
            })
            .disposed(by: disposeBag)

        featureView.featureImagge.button.rx.tap
            .observe(on: scheduler.main)
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                owner.tapFeatureImage?()
            })
            .disposed(by: disposeBag)
        
        featureView.featureSketch.button.rx.tap
            .observe(on: scheduler.main)
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                owner.tapFeatureDoodle?()
            })
            .disposed(by: disposeBag)

        featureView.featureQRCode.button.rx.tap
            .observe(on: scheduler.main)
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                owner.tapFeatureQr?()
            })
            .disposed(by: disposeBag)
        
        featureView.featureChatBot.button.rx.tap
            .observe(on: scheduler.main)
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                owner.tapFeatureChatBot?()
            })
            .disposed(by: disposeBag)
    }
}
    
