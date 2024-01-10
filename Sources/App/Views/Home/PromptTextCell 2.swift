import Foundation
import SnapKit
import UIKit

class PromptTextCell: UITableViewCell {
    
    private lazy var backgroundCellView = UIView()
    private lazy var promptLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews() {
        backgroundCellView.backgroundColor = AppColor.darkGrayColor
        backgroundCellView.cornerRadius = 15.scaleX
        
        promptLabel.font = UIFont.appFont(size: 14)
        promptLabel.textColor = AppColor.whiteTextColor
        promptLabel.numberOfLines = 0
        promptLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupConstrains() {
        contentView.addSubview(backgroundCellView)
        backgroundCellView.addSubview(promptLabel)
        
        backgroundCellView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(12.scaleX)
        }
        
        promptLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(22.scaleX)
            $0.top.bottom.equalToSuperview().inset(17.scaleX)
        }
    }
    
    public func update(prompt: String){
        promptLabel.text = prompt
    }
}


