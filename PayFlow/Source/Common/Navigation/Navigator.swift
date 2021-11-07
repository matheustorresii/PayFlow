//
//  Navigator.swift
//  TicTacToe
//
//  Created by Matheus Torres on 21/08/21.
//

import UIKit
import SafariServices

protocol Navigator: UIViewController, FlowController {
    var flowNavigationController: UINavigationController { get }

    func createRouteStack(to route: Route, itsReplace: Bool, includeDuplicates: Bool) -> [UIViewController]
    func navigate(to route: Route, animated: Bool)
    func replace<T: Navigator>(_ navigator: T, with route: Route)
    func replace(route: Route)
    func popTo(route: Route)
    func popTo(viewController: UIViewController)
    func present(route: Route)
    func goBack()
    func popToTop()
    func dismiss(_ completion: (() -> Void)?)
    func dismissAll(_ completion: (() -> Void)?)
    func open(url: URL)
}

extension Navigator {
    var rootViewController: UIViewController? {
        get {
            return flowNavigationController.viewControllers.first
        }
        set {
            guard let newValue = newValue else { return }
            flowNavigationController.setViewControllers([newValue], options: .allowAnimatedContent)
            flowNavigationController.isNavigationBarHidden = true
            if !children.contains(flowNavigationController) {
                add(flowNavigationController)
            }
        }
    }

    func createRouteStack(to route: Route, itsReplace: Bool = false, includeDuplicates: Bool = false) -> [UIViewController] {
        var result = [UIViewController]()

        for route in route.stack {
            guard let realRoute = route as? Route else { continue }
            if let controller = prepareForTransition(to: realRoute), itsReplace || flowNavigationController.viewController(ofClass: type(of: controller)) == nil {
                result.append(controller)
            }
        }

        if let controller = prepareForTransition(to: route), itsReplace || includeDuplicates || flowNavigationController.viewController(ofClass: type(of: controller)) == nil {
            result.append(controller)
        }

        return result
    }

    func navigate(to route: Route, animated: Bool = true) {
        let stack = createRouteStack(to: route, itsReplace: true)
        if stack.count == 1, let firstController = stack.first {
            flowNavigationController.pushViewController(firstController, animated: animated)
        } else {
            flowNavigationController.setViewControllers(flowNavigationController.viewControllers + stack, animated: animated)
            self.route = route
        }
    }

    func replace<T: Navigator>(_ navigator: T, with route: Route) {
        navigator.rootViewController = prepareForTransition(to: route)
    }

    func replace(route: Route) {
        let stack = createRouteStack(to: route, itsReplace: true)
        flowNavigationController.setViewControllers(stack, options: .transitionCrossDissolve)
        self.route = route
    }

    func popTo(route: Route) {
        guard let viewController = prepareForTransition(to: route) else { return }
        let targetViewController = flowNavigationController.viewControllers.first {
            $0.classForCoder == viewController.classForCoder
        }
        if let targetViewController = targetViewController {
            flowNavigationController.popToViewController(targetViewController, animated: true)
        }
        self.route = route
    }

    func popTo(viewController: UIViewController) {
        flowNavigationController.popToViewController(viewController, animated: true)
    }

    func present(route: Route) {
        guard let controller = prepareForTransition(to: route) else { return }
        flowNavigationController.present(controller, animated: true, completion: nil)
        self.route = route
    }

    func goBack() {
        if flowNavigationController.viewControllers.count == 1 {
            var parentViewController = flowNavigationController.parent
            var navigationController = parentViewController as? UINavigationController
            while navigationController == nil {
                parentViewController = parentViewController?.parent as? UINavigationController
                navigationController = parentViewController as? UINavigationController
            }
            navigationController?.popViewController(animated: true)
        } else {
            flowNavigationController.popViewController(animated: true)
        }
    }

    func popToTop() {
        if flowNavigationController.viewControllers.count == 1 {
            var parentViewController = flowNavigationController.parent
            var navigationController = parentViewController as? UINavigationController
            while navigationController == nil {
                parentViewController = parentViewController?.parent as? UINavigationController
                navigationController = parentViewController as? UINavigationController
            }
            navigationController?.popToRootViewController(animated: true)
        } else {
            flowNavigationController.popToRootViewController(animated: true)
        }
    }

    func dismiss(_ completion: (() -> Void)?) {
        flowNavigationController.dismiss(animated: true, completion: completion)
    }

    func dismissAll(_ completion: (() -> Void)?) {
        UIApplication.shared.delegate?.window??.rootViewController?.dismiss(animated: true, completion: completion)
    }

    func open(url: URL) {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let webView = SFSafariViewController(url: url, configuration: config)
        flowNavigationController.present(webView, animated: true, completion: nil)
    }
}
