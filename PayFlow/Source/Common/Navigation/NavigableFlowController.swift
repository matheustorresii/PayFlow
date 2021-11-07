//
//  NavigableFlowController.swift
//  TicTacToe
//
//  Created by Matheus Torres on 21/08/21.
//

import UIKit

class NavigableFlowController<T: RouteProtocol>: UIViewController, Navigator {

    // MARK: - PUBLIC PROPERTIES

    let flowNavigationController = UINavigationController()
    var route: T?

    // MARK: - INITIALIZERS

    init(route: T?) {
        self.route = route
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LIFE CYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupRoute()
    }

    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupRoute() {
        guard let route = route else { return }
        let controllers = createRouteStack(to: route)
        if controllers.count > 1 {
            flowNavigationController.setViewControllers(controllers, animated: false)
            add(flowNavigationController)
        } else {
            rootViewController = controllers.first
        }
    }

    // MARK: - PUBLIC METHODS

    func prepareForTransition(to route: T) -> UIViewController? {
        fatalError("must override!")
    }

    func handle(route: RouteProtocol, navigationController: UINavigationController?) {
        guard let realRoute = route as? Route else { return }
        navigationController?.popToViewController(self, animated: true)
        replace(route: realRoute)
    }
}
