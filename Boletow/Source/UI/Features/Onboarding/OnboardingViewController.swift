//
//  OnboardingViewController.swift
//  Boletow
//
//  Created by Matheus Torres on 31/10/21.
//

import UIKit

class OnboardingViewController: UIViewController, OnboardingViewControllerProtocol {
    
    // MARK: - PUBLIC PROPERTIES
    
    weak var delegate: OnboardingViewControllerDelegate?
    
    // MARK: - PRIVATE PROPERTIES
    
    private let viewModel: OnboardingViewModelProtocol

    // MARK: - UI
    
    // MARK: - INITIALIZERS
    
    init(viewModel: OnboardingViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        layoutView()
        constraintUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ONBOARDING_VIEW_CONTROLLER")
    }
    // MARK: - PRIVATE METHODS
    
    private func layoutView() {
        view.backgroundColor = .white
    }
    
    private func constraintUI() { }
}
