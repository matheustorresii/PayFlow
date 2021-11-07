//
//  OnboardingViewControllerProtocol.swift
//  PayFlow
//
//  Created by Matheus Torres on 31/10/21.
//

import UIKit

protocol OnboardingViewControllerProtocol: UIViewController {
    var delegate: OnboardingViewControllerDelegate? { get set }
}
