//
//  OnboardingMessage.swift
//  Techl-Neo
//
//  Created by 문정호 on 2022/11/28.
//

import Foundation

struct OnboardingMessage {
    let imageName: String
    let title: String
    let description: String
}

extension OnboardingMessage {
    static let messages: [OnboardingMessage]  = [
        OnboardingMessage(imageName: "onboarding-1", title: "DISCUSS", description: "기술서적의 후기와 담론을\n포럼에서 자유롭게 할 수 있어요"),
        OnboardingMessage(imageName: "onboarding-2", title: "READ TOGETHER", description: "북클럽/챌린지에서\n기술서적을 함께 읽어봐요."),
        OnboardingMessage(imageName: "onboarding-3", title: "BOOKMARK", description: "관심있는 서적들을 북마크하여\n새 활동을 모아볼 수 있어요.")
    ]
}
