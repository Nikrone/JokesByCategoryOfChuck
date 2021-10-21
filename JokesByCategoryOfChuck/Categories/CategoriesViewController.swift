//
//  CategoriesViewController.swift
//  JokesByCategoryOfChuck
//
//  Created Evgeniy Nosko on 21.10.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

protocol CategoriesViewProtocol: AnyObject {
    
}


class CategoriesViewController: UIViewController {
    
    var presenter: CategoriesPresenterProtocol = CategoriesPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.view = self
        presenter.viewDidLoad()
    }
}

extension CategoriesViewController: CategoriesViewProtocol {
    func reloadData() {
        
    }
}
