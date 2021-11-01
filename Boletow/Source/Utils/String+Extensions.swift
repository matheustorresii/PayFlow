//
//  String+Extensions.swift
//  Boletow
//
//  Created by Matheus Torres on 01/11/21.
//

import Foundation

enum Strings: String {
    case onboardingMessage = "onboarding.message"
    case onboardingLoginGoogle = "onboarding.login.google"
    case onboardingLoginGuest = "onboarding.login.guest"
}

extension String {
    static func localized(as string: Strings) -> String {
        return NSLocalizedString(string.rawValue, comment: "")
    }
}

