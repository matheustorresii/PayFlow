//
//  HomeViewControllerProtocol.swift
//  Boletow
//
//  Created by Matheus Torres on 31/10/21.
//

import UIKit

protocol HomeViewControllerProtocol: UIViewController {
    var delegate: HomeViewControllerDelegate? { get set }
}
