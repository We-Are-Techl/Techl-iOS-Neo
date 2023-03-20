//
//  ConciergeLoginView.swift
//  Techl-Neo
//
//  Created by 문정호 on 2023/03/20.
//

import UIKit
import Then
import SnapKit

class ConciergeLoginView: BaseView {
    //MARK: - Properties
    let logoImg = UIImageView().then {
        $0.image = UIImage(named: "logo")
        $0.contentMode = .scaleAspectFit
    }
    
    let firstLineTextLabel1 = UILabel().then {
        $0.text = "책마다의"
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 20)
        $0.textColor = .white
    }
    
    let firstLineTextLabel2 = UILabel().then {
        $0.text = "포럼"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        $0.textColor = .white
    }
    
    let firstLineTextLabel3 = UILabel().then {
        $0.text = "과"
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 20)
        $0.textColor = .white
    }
    
    let firstLineTextLabel4 = UILabel().then {
        $0.text = "북클럽"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        $0.textColor = .white
    }
    
    let firstLineTextLabel5 = UILabel().then {
        $0.text = "으로"
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 20)
        $0.textColor = .white
    }
    
    let secondLineTextLabel1 = UILabel().then{
        $0.text = "액티브리딩"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        $0.textColor = .white
    }
    
    let secondLineTextLabel2 = UILabel().then{
        $0.text = "을 할 수 있는"
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 20)
        $0.textColor = .white
    }
    
    let thirdLineTextLabel = UILabel().then {
        $0.text = "기술서적 커뮤니티, 태클"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        $0.textColor = .white
    }
    
    lazy var textStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fill
        $0.spacing = 8
    }
    lazy var firstLineStack = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 6
    }
    lazy var firstLineFirstStack = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 0
    }
    lazy var firstLineSecondStack = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 0
    }
    lazy var secondLineStack = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 0
    }
    
    let phoneNumberLoginButton = UIButton().then{
        $0.setTitle("휴대전화로 로그인", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        $0.titleLabel?.tintColor = .white
        $0.backgroundColor = .clear
    }
    
    let lineView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let signUpButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Light", size: 15)
        $0.titleLabel?.tintColor = .white
        $0.backgroundColor = .clear
    }
    
    //MARK: - setupUI
    override func setupUI() {
        self.backgroundColor = UIColor.CustomColor.primaryColor
        self.addSubview(logoImg)
        //텍스트 첫번째줄 스택뷰 삽입
        firstLineFirstStack.addArrangedSubview(firstLineTextLabel2)
        firstLineFirstStack.addArrangedSubview(firstLineTextLabel3)
        
        firstLineSecondStack.addArrangedSubview(firstLineTextLabel4)
        firstLineSecondStack.addArrangedSubview(firstLineTextLabel5)
        
        firstLineStack.addArrangedSubview(firstLineTextLabel1)
        firstLineStack.addArrangedSubview(firstLineFirstStack)
        firstLineStack.addArrangedSubview(firstLineSecondStack)
        
        // 텍스트 두번째줄 스택뷰 삽입
        secondLineStack.addArrangedSubview(secondLineTextLabel1)
        secondLineStack.addArrangedSubview(secondLineTextLabel2)
        
        //최종 텍스트들 스택뷰에 삽입
        textStackView.addArrangedSubview(firstLineStack)
        textStackView.addArrangedSubview(secondLineStack)
        textStackView.addArrangedSubview(thirdLineTextLabel)
        
    
        //최종 스택뷰 뷰에 삽입
        self.addSubview(textStackView)
        
        self.addSubview(phoneNumberLoginButton)
        self.addSubview(lineView)
        self.addSubview(signUpButton)
    }
    
    //MARK: - setConstraints
    override func setConstraints() {
        logoImg.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.28)
            make.height.equalTo(logoImg.snp.width)
            make.leading.equalToSuperview().inset(36)
            make.centerY.equalToSuperview().multipliedBy(0.5)
        }
        
        textStackView.snp.makeConstraints{ make in
            make.leading.equalTo(logoImg.snp.leading)
            make.top.equalTo(logoImg.snp.bottom).offset(24)
        }
        
        signUpButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(24)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.bottom.equalTo(signUpButton.snp.top).offset(-12)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        phoneNumberLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(lineView.snp.top).offset(-12)
        }
    }

}
