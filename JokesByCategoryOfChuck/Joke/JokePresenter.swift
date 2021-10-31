//
//  JokePresenter.swift
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

// MARK: View -
protocol JokePresenterProtocol {
    var view: JokeViewProtocol? { get set }
    func viewDidLoad()
    func updateJokeLabel()
}

class JokePresenter: JokePresenterProtocol {
    
    private let category: String
    private var joke: Joke?
    
    init(category: String) {
        self.category = category
    }
    
    weak var view: JokeViewProtocol?
    
    func viewDidLoad() {
        updateJokeLabel()
    }
    
    func updateJokeLabel() {
        AF.request("https://api.chucknorris.io/jokes/random?category=\(category)").responseDecodable(of: Joke.self) { (data) in
            print(data)
            self.joke = data.value
            DispatchQueue.main.async {
                self.view?.updateJokeLabel(with: self.joke!.value)
            }
        }.resume()
        
        self.view?.updateImageView()
    }
}
