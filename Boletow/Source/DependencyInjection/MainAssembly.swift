//
//  MainAssembly.swift
//  Boletow
//
//  Created by Matheus Torres on 30/10/21.
//

import Foundation
import Swinject

class MainAssembly: Assembly {
    
    // MARK: - ASSEMBLE
    
    func assemble(container: Container) {
        registerFactory(container)
        registerFlowController(container)
        assembleViewControllers(container)
    }
    
    private func assembleViewControllers(_ container: Container) {
        registerHomeViewController(container)
    }
    
    // MARK: - FACTORY
    
    private func registerFactory(_ container: Container) {
        container.register(MainFactoryProtocol.self) { resolver in
            return MainFactory(resolver: resolver)
        }
    }
    
    // MARK: - FLOW CONTROLLER
    
    private func registerFlowController(_ container: Container) {
        container.register(MainFlowControllerProtocol.self) { (resolver, route: MainRoute) in
            let factory = resolver.resolveUnwrapping(MainFactoryProtocol.self)
            return MainFlowController(factory: factory, route: route)
        }
    }
    
    // MARK: - VIEW CONTROLLERS
    
    private func registerHomeViewController(_ container: Container) {
        container.register(HomeViewModelProtocol.self) { (_, model: HomeModel) in
            return HomeViewModel(model: model)
        }
        
        container.register(HomeViewControllerProtocol.self) { (resolver, model: HomeModel) in
            let viewModel = resolver.resolveUnwrapping(HomeViewModelProtocol.self, argument: model)
            return HomeViewController(viewModel: viewModel)
        }
    }
}
