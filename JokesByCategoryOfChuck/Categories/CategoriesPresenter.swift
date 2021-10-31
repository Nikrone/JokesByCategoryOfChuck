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
import CoreData

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
    
    private var categories: [String] = []
    
    func viewDidLoad() {
            updateOfCategories()
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
    
    func category(for indexPath: IndexPath) -> String {
        return categories[indexPath.row]
    }
    
    func numberOfCategories() -> Int {
        return categories.count
    }
    
    
}
