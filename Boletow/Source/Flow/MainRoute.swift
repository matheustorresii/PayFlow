//
//  MainRoute.swift
//  Boletow
//
//  Created by Matheus Torres on 30/10/21.
//

import Foundation

enum MainRoute: RouteProtocol, CaseIterable, DefaultRoutable {
    case home
    
    static var defaultRoute: MainRoute { .home }
}
