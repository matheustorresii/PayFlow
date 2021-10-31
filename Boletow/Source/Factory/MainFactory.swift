//
//  MainFactory.swift
//  Boletow
//
//  Created by Matheus Torres on 30/10/21.
//

import Foundation
import Swinject

class MainFactory: MainFactoryProtocol {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let resolver: Resolver
    
    // MARK: - INITIALIZERS
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    // MARK: - PUBLIC METHODS
    
    func makeHomeViewController(with model: HomeModel) -> HomeViewControllerProtocol {
        return resolver.resolveUnwrapping(HomeViewControllerProtocol.self, argument: model)
    }
}
