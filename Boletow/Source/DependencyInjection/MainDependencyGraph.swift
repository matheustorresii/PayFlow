//
//  MainDependencyGraph.swift
//  Boletow
//
//  Created by Matheus Torres on 30/10/21.
//

import Foundation
import Swinject

class MainDependencyGraph {
    static func build() -> [Assembly] {
        return [MainAssembly()]
    }
}
