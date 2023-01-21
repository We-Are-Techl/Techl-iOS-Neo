//
//  OnboardingCollectionViewCell.swift
//  Techl-Neo
//
//  Created by 문정호 on 2022/11/28.
//

import UIKit
import SnapKit
import Then

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OnboardingCollectionViewCell"
    
    let thumbnailImageView = UIImageView()
    let titleLabel = UILabel().then{
        $0.textAlignment = .center
        $0.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 28)
    }
    let descriptionLabel = UILabel().then{
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.font = UIFont(name: "Apple SD Gothic Neo SemiBold", size: 22)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ message: OnboardingMessage) {
        thumbnailImageView.image = UIImage(named: message.imageName)
        titleLabel.text = message.title
        descriptionLabel.text = message.description
    }
    
    func setUI(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(thumbnailImageView)
    }
    
    func setConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(contentView.snp.top).offset(24)
            make.trailing.equalTo(contentView.snp.trailing).offset(-24) // x좌표 기준으로 -24가 되어야 하기 때문에
            make.leading.equalTo(contentView.snp.leading).offset(24)
            
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
            make.trailing.equalTo(titleLabel.snp.trailing)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        thumbnailImageView.snp.makeConstraints{ make in
            make.trailing.equalTo(titleLabel.snp.trailing)
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(31)
            make.height.equalTo(thumbnailImageView.snp.width).multipliedBy(1/1) //aspect ratio 1:1
        }
    }
}
