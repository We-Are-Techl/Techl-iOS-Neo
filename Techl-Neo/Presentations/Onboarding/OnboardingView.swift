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
    // MARK: - Properties
    let identifier = "OnboardingView"
    
    let onboardingCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then { //CollectionView
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //CollectionView scroll 방향을 수평으로 설정합니다.
        $0.decelerationRate = .fast //사용자가 손가락을 뗀 후 감속 비율을 결정하는 부동 소수점 값입니다. -> 빠르게 설정
        $0.collectionViewLayout = layout
        $0.backgroundColor = .clear //collectionView의 배경을 투명하게 만듭니다.
        $0.showsHorizontalScrollIndicator = false //collectionView의 스크롤바가 보이지 않게 설정합니다.
    }
    
    let pageControl: UIPageControl = UIPageControl().then {
        $0.currentPageIndicatorTintColor = UIColor.CustomColor.primaryColor
        $0.tintColor = .darkGray
        $0.isUserInteractionEnabled = false
        $0.numberOfPages = OnboardingMessage.messages.count
        $0.currentPage = 0
    }
    
    let skipButton: UIButton = UIButton().then {
        $0.isHidden = false
        $0.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo SemiBold", size: 14)
        $0.setTitle("건너뛰기", for: .normal)
        $0.setTitleColor(.darkGray, for: .normal)
        $0.backgroundColor = .clear
    }
    
    let nextButton: UIButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft //이미지를 텍스트 오른쪽으로 변경
        $0.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo SemiBold", size: 14)
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .CustomColor.primaryColor
        $0.tintColor = .white
    }
    
    var stackView = UIStackView().then{
        $0.distribution = .fillProportionally
        $0.spacing = 17
        $0.axis = .horizontal
    }
    
    
    // MARK: - setupUI
    /// UI 설정
    /// - addSubviews를 하거나 뷰의 배경색을 바꾸는 등 설정을 합니다.
    override func setupUI() {
        self.addSubview(onboardingCollectionView)
        self.addSubview(pageControl)
        stackView.insertArrangedSubview(skipButton, at: 0)
        stackView.insertArrangedSubview(nextButton, at: 1)
        self.addSubview(stackView)
        backgroundColor = .CustomColor.backgroundColor
    }
    
    
    // MARK: - setConstraints
    /// UI 제약조건 설정
    /// - Anchor, Snapkit 등을 이용해 UI 컴포넌트의 위치, 크기 등 제약조건을 설정합니다.
    override func setConstraints() {
        pageControl.snp.makeConstraints{ make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(24)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        
        onboardingCollectionView.snp.makeConstraints { make in
            make.trailing.leading.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(pageControl.snp.bottom).offset(10)
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.669643)
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(stackView.snp.height)
        }
        
        skipButton.snp.makeConstraints{ make in
            make.width.equalTo(stackView.snp.width).multipliedBy(0.25)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(24)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-24)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-30) //바닥 보다 30 올라가야 하기 때문에 offset -30
            make.height.equalTo(50)
        }
    }
    
    //MARK: - Helper
    
    
   
}


