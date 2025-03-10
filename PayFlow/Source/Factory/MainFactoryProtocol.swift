//
//  MainFactoryProtocol.swift
//  PayFlow
//
//  Created by Matheus Torres on 30/10/21.
//

import UIKit

protocol MainFactoryProtocol {
    func makeHomeViewController(with model: HomeModel) -> HomeViewControllerProtocol
    func makeOnboardingViewController(with model: OnboardingModel) -> OnboardingViewControllerProtocol
}
