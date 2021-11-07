//
//  UIViewController+Extensions.swift
//  PayFlow
//
//  Created by Matheus Torres on 30/10/21.
//

import UIKit

extension UIViewController {
    func add(_ child: UIViewController, onView superView: UIView? = nil, bottomConstraintPriority: UILayoutPriority? = nil) {
        
        addChild(child)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        
        if let superView = superView {
            superView.addSubview(child.view)
        } else {
            view.addSubview(child.view)
        }
        
        let topConstriant = child.view.topAnchor.constraint(equalTo: view.topAnchor)
        let leadingConstraint = child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let bottomConstraint = child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        bottomConstraint.priority = bottomConstraintPriority ?? .required
        
        NSLayoutConstraint.activate([topConstriant,
                                     leadingConstraint,
                                     trailingConstraint,
                                     bottomConstraint])
        
        child.didMove(toParent: self)
    }
}
