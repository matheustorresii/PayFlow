//
//  MainRoute.swift
//  PayFlow
//
//  Created by Matheus Torres on 30/10/21.
//

import Foundation

enum MainRoute: RouteProtocol, CaseIterable, DefaultRoutable {
    case home
    case onboarding
    
    static var defaultRoute: MainRoute { .onboarding }
}
