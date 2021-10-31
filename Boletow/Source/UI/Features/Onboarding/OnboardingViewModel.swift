//
//  OnboardingViewModel.swift
//  Boletow
//
//  Created by Matheus Torres on 31/10/21.
//

import Foundation
import RxSwift

class OnboardingViewModel: OnboardingViewModelProtocol {
    
    // MARK: - PUBLIC PROPERTIES
    
    var viewState: BehaviorSubject<OnboardingViewState> = .init(value: .ready)
    
    // MARK: - PRIVATE PROPERTIES

    private let model: OnboardingModel
    
    // MARK: - INITIALIZERS
    
    init(model: OnboardingModel) {
        self.model = model
    }
}
