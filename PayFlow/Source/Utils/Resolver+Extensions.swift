//
//  Resolver+Extensions.swift
//  PayFlow
//
//  Created by Matheus Torres on 30/10/21.
//

import Foundation
import Swinject

extension Resolver {
    func resolveUnwrapping<Service>(_ serviceType: Service.Type) -> Service {
        if let resolution = resolve(serviceType) {
            return resolution
        }
        fatalError("\(serviceType) resolution failed")
    }
    
    func resolveUnwrapping<Service, Arg1>(_ serviceType: Service.Type, argument: Arg1) -> Service {
        if let resolution = resolve(serviceType, argument: argument) {
            return resolution
        }
        fatalError("\(serviceType) resolution failed")
    }
    
    func resolveUnwrapping<Service, Arg1, Arg2>(_ serviceType: Service.Type,
                                                arguments arg1: Arg1,
                                                _ arg2: Arg2) -> Service {
        if let resolution = resolve(serviceType, arguments: arg1, arg2) {
            return resolution
        }
        fatalError("\(serviceType) resolution failed")
    }
}
