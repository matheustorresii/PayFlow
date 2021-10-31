//
//  HomeViewModelProtocol.swift
//  Boletow
//
//  Created by Matheus Torres on 31/10/21.
//

import Foundation
import RxSwift

protocol HomeViewModelProtocol: AnyObject {
    
    // MARK: - PUBLIC PROPERTIES
    
    var viewState: BehaviorSubject<HomeViewState> { get set }
}
