//
//  RouteProtocol.swift
//  TicTacToe
//
//  Created by Matheus Torres on 21/08/21.
//

import Foundation

protocol RouteProtocol {
    var id: String { get }
    var stack: [RouteProtocol] { get }
}

extension RouteProtocol {
    var id: String { String(describing: self) }
    var stack: [RouteProtocol] { [] }
}
