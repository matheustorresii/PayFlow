//
//  MainFlowController.swift
//  PayFlow
//
//  Created by Matheus Torres on 31/10/21.
//

import UIKit

class MainFlowController: NavigableFlowController<MainRoute>, MainFlowControllerProtocol {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let factory: MainFactoryProtocol
    
    // MARK: - INITIALIZERS
    
    init(factory: MainFactoryProtocol, route: MainRoute) {
        self.factory = factory
        super.init(route: route)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LIFE CYCLE
    
    override func prepareForTransition(to route: MainRoute) -> UIViewController? {
        switch route {
        case .home:
            return presentHomeViewController()
        case .onboarding:
            return presentOnboardingViewController()
        }
    }
    
    // MARK: - PRIVATE METHODS
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func presentHomeViewController() -> UIViewController {
        return factory.makeHomeViewController(with: HomeModel())
    }
    
    private func presentOnboardingViewController() -> UIViewController {
        return factory.makeOnboardingViewController(with: OnboardingModel())
    }
}
