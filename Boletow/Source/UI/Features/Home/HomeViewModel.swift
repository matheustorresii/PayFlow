//
//  HomeViewModel.swift
//  Boletow
//
//  Created by Matheus Torres on 31/10/21.
//

import Foundation
import RxSwift

class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - PUBLIC PROPERTIES
    
    var viewState: BehaviorSubject<HomeViewState> = .init(value: .ready)
    
    // MARK: - PRIVATE PROPERTIES

    private let model: HomeModel
    
    // MARK: - INITIALIZERS
    
    init(model: HomeModel) {
        self.model = model
    }
}
