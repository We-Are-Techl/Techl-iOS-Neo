//
//  OnboardingVC.swift
//  Techl-Neo
//
//  Created by 문정호 on 2022/11/28.
//

import UIKit

/// 베이스 뷰 컨트롤러
/// - loadView() 메서드를 오버라이드한 후 view를 커스텀 뷰로 교체해줄 수 있다.
class OnboardingVC: BaseVC {
    
    //MARK: - Properties
    
    let onboardingView = OnboardingView()
    
    
    var isFinished: Bool = false
    
    let messages: [OnboardingMessage] = OnboardingMessage.messages
    
    var currentIndex: Int = 0 { // skipButton isHidden 설정 변수
        didSet {
            buttonDesignUI()
            onboardingView.skipButton.isHidden = (currentIndex ==  messages.count - 1 ? true : false)
            if currentIndex < messages.count - 1 {
                isFinished = false
            }
        }
    }
    //MARK: - LifeCycle
    override func loadView() {
        view = onboardingView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - configure
    /// Delegate, Register, AddTarget 등
    override func configure() {
        onboardingView.onboardingCollectionView.delegate = self
        onboardingView.onboardingCollectionView.dataSource = self
        
        onboardingView.onboardingCollectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
        onboardingView.skipButton.addTarget(self, action: #selector(skipButtonTapped(_:)), for: .touchUpInside)
        onboardingView.nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
    }
    
    //MARK: - setNavigationBar
    
    /// 네비게이션 바 설정
    /// - 타이틀, 아이템 등 네비게이션과 관련된 설정을 합니다.
    override func setNavigationBar() {
    }
    
    //MARK: - Helper
    
    @objc func nextButtonTapped(_ sender: UIButton!){
        let index = currentIndex == messages.count - 1 ? currentIndex : (currentIndex + 1) % 3
        currentIndex = index
        
        onboardingView.onboardingCollectionView.scrollToItem(at: [0, currentIndex], at: .right, animated: true)
        
        onboardingView.pageControl.currentPage = currentIndex
        
        if isFinished == true {
            
            print("skip")
        }
        
        if onboardingView.nextButton.currentTitle == "완료" && currentIndex == messages.count - 1 {
            // 완료일 때 화면 이동
            isFinished = true
        }
        
    }
    
    @objc func skipButtonTapped(_ sender: UIButton!){
        print("skip")
    }
    
    func buttonDesignUI() {
        onboardingView.nextButton.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo SemiBold", size: 14)
        onboardingView.nextButton.layer.cornerRadius = 8
        
        
        if currentIndex < messages.count - 1 {
            onboardingView.skipButton.isHidden = false
            onboardingView.nextButton.setTitle("다음", for: .normal)
            onboardingView.nextButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            
        } else { // 완료일 때 화면전환
            onboardingView.skipButton.isHidden = true
            onboardingView.nextButton.setTitle("완료", for: .normal)
            onboardingView.nextButton.setImage(UIImage(), for: .normal)
            onboardingView.nextButton.layer.borderWidth = 0
        }
    }

}

//MARK: - extenstion

extension OnboardingVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }
        
        let message = messages[indexPath.item]
        cell.configure(message)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:  UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = UIScreen.main.bounds.width
        let height: CGFloat = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
}

extension OnboardingVC: UIScrollViewDelegate {
    //현재 페이지가 어디에 위치해 있는지 Indexing 하는 메소드
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x/scrollView.bounds.width)
        onboardingView.pageControl.currentPage = index
        currentIndex = index
        
    }
    //carousel 적용 메소드
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let scrolledOffsetX = targetContentOffset.pointee.x + scrollView.contentInset.left
        let cellWidth = UIScreen.main.bounds.width
        let index = round(scrolledOffsetX / cellWidth)
        targetContentOffset.pointee = CGPoint(x: index * cellWidth - scrollView.contentInset.left, y: scrollView.contentInset.top)
    }
}

