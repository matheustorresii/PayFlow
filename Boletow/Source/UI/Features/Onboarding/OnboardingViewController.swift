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
    
    let messageLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .interFont(ofSize: 32, weight: .w600)
        return label
    }()
    
    let googleButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar com o Google", for: .normal)
        return button
    }()
    
    let guestButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar como visitante", for: .normal)
        return button
    }()
    
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
    
    private func constraintUI() {
    }
}
