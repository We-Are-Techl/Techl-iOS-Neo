//
//  OnboardingView.swift
//  Techl-Neo
//
//  Created by 문정호 on 2022/11/28.
//

import UIKit
import SnapKit
import Then

class OnboardingView: BaseView {
    
    var onboardingCollectionView: UICollectionView!
    let pageControl: UIPageControl = UIPageControl().then { make in
    }
    let skipButton: UIButton = UIButton().then {
        $0.isHidden = false
        $0.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo SemiBold", size: 14)
    }
    let nextButton: UIButton = UIButton().then {
        $0.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo SemiBold", size: 14)
        $0.layer.cornerRadius = 8
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    /// UI 설정
    /// - addSubviews를 하거나 뷰의 배경색을 바꾸는 등 설정을 합니다.
    override func setupUI() {
        
    }
    
    /// UI 제약조건 설정
    /// - Anchor, Snapkit 등을 이용해 UI 컴포넌트의 위치, 크기 등 제약조건을 설정합니다.
    override func setConstraints() {
        
        onboardingCollectionView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
        }
    }
    
    
   
}
