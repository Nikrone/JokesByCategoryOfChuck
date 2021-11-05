//
//  CategoriesPresenter.swift
//  JokesByCategoryOfChuck
//
//  Created Evgeniy Nosko on 21.10.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit
import MBProgressHUD
import Alamofire

protocol CategoriesPresenterProtocol {
    var view: CategoriesViewProtocol? { get set }
    
    func viewDidLoad()
    func updateOfCategories()
    func category(for indexPath: IndexPath) -> String
    func numberOfCategories() -> Int
}

class CategoriesPresenter: CategoriesPresenterProtocol {
    
    weak var view: CategoriesViewProtocol?
    
    private let random = "Random"
    
    var categories: [String] = []
    
    func viewDidLoad() {
        updateOfCategories()
        //        DatabaseService.shared.entitiesFor(
        //            type: CategoryDatabaseModel.self,
        //            context: DatabaseService.shared.persistentContainer.mainContext,
        //            closure: { category in
        //                self.categories = categories.map({ category in
        //                    return category.
        //                })
        //            })
    }
    
    
    func category(for indexPath: IndexPath) -> String {
        DatabaseService.shared.insertEntityFor(
            type: CategoryDatabaseModel.self,
            context: DatabaseService.shared.persistentContainer.mainContext,
            closure: { category in
                category.categories = category
                DatabaseService.shared.saveMain(nil)
            }
        )
        return categories[indexPath.row]
    }
    
    func numberOfCategories() -> Int {
        return categories.count
    }
    
    func updateOfCategories() {
        AF.request("https://api.chucknorris.io/jokes/categories").responseJSON { (data) in
            print(data)
            self.categories = data.value as! [String]
            self.categories.insert(self.random, at: 0)
            DispatchQueue.main.async {
                self.view?.reloadData()
            }
        }.resume()
        
    }
    
    
}
