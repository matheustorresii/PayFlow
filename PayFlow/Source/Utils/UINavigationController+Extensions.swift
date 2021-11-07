//
//  UINavigationController+Extensions.swift
//  PayFlow
//
//  Created by Matheus Torres on 30/10/21.
//

import UIKit

extension UINavigationController {
    func setViewControllers(_ viewControllers: [UIViewController], options: UIView.AnimationOptions) {
        UIView.transition(with: view,
                          duration: 0.3,
                          options: options,
                          animations: { [weak self] in
                            self?.setViewControllers(viewControllers, animated: false)
        }, completion: nil)
    }

    func viewController(ofClass: AnyClass) -> UIViewController? {
        return viewControllers.filter { $0.isKind(of: ofClass) }.last
    }
}
