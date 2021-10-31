//
//  MainFactoryProtocol.swift
//  Boletow
//
//  Created by Matheus Torres on 30/10/21.
//

import UIKit

protocol MainFactoryProtocol {
    func makeHomeViewController(with model: HomeModel) -> HomeViewControllerProtocol
}
