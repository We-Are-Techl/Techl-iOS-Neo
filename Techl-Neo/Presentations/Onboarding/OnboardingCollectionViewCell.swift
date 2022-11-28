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
    
    weak var thumbnailImageView: UIImageView!
    weak var titleLabel: UILabel!
    weak var descriptionLabel: UILabel!
    
    func configure(_ message: OnboardingMessage) {
        thumbnailImageView.image = UIImage(named: message.imageName)
        titleLabel.text = message.title
        descriptionLabel.text = message.description
    }
}
