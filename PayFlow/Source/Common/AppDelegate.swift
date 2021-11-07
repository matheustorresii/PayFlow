//
//  AppDelegate.swift
//  PayFlow
//
//  Created by Matheus Torres on 30/10/21.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - UIApplicationDelegate

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        launch()
    }

    // MARK: - PRIVATE PROPERTIES
    
    private lazy var assembler: Assembler = {
        var assemblies = [Assembly]()
        assemblies.append(contentsOf: MainDependencyGraph.build())
        return Assembler(assemblies)
    }()

    // MARK: - PRIVATE METHODS

    private func launch() -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let flowController = assembler.resolver.resolveUnwrapping(MainFlowControllerProtocol.self, argument: MainRoute.defaultRoute)
        window?.rootViewController = flowController
        window?.makeKeyAndVisible()
        return true
    }
}
