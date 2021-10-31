//
//  RoutableFlowController.swift
//  TicTacToe
//
//  Created by Matheus Torres on 21/08/21.
//

import UIKit

protocol RoutableFlowController {
    func handle(route: RouteProtocol, navigationController: UINavigationController?)
}

protocol FlowController: AnyObject, RoutableFlowController {
    associatedtype Route: RouteProtocol
    var route: Route? { get set }
    func prepareForTransition(to route: Route) -> UIViewController?
}

protocol DefaultRoutable {
    associatedtype DefaultRoute: RouteProtocol
    static var defaultRoute: Self.DefaultRoute { get }
}
