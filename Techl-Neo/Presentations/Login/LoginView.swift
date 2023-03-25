//
//  LoginView.swift
//  Techl-Neo
//
//  Created by 문정호 on 2023/03/25.
//

import UIKit
import SnapKit
import Then
import TextFieldEffects

class LoginView: BaseView {
    //MARK: - Properties
    let titleLabel = UILabel().then {
        $0.text = "휴대전화로 로그인"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    }
    
    let phoneNumberTextField = HoshiTextField().then {
        $0.placeholder = "휴대전화번호"
        $0.borderActiveColor = .CustomColor.primaryColor
        $0.borderInactiveColor = .darkGray
        $0.textContentType = .telephoneNumber
    }
    
    
    //MARK: - setupUI
    override func setupUI() {
        
    }
    
    //MARK: - setConstraints
    override func setConstraints() {
        
    }

}
