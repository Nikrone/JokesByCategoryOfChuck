//
//  CategoriesPresenter.swift
//  JokesByCategoryOfChuck
//
//  Created Evgeniy Nosko on 21.10.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

protocol CategoriesPresenterProtocol {
    var view: CategoriesViewProtocol? { get set }
    func viewDidLoad()
}

class CategoriesPresenter: CategoriesPresenterProtocol {

    weak var view: CategoriesViewProtocol?

    func viewDidLoad() {
        
    }
    
}


