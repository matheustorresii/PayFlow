//
//  OnboardingViewModelProtocol.swift
//  PayFlow
//
//  Created by Matheus Torres on 31/10/21.
//

import Foundation
import RxSwift

protocol OnboardingViewModelProtocol: AnyObject {
    
    // MARK: - PUBLIC PROPERTIES
    
    var viewState: BehaviorSubject<OnboardingViewState> { get set }
}
