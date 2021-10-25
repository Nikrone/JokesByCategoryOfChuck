//
//  JokePresenter.swift
//  JokesByCategoryOfChuck
//
//  Created Evgeniy Nosko on 21.10.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

// MARK: View -
protocol JokePresenterProtocol {
    var view: JokeViewProtocol? { get set }
    func viewDidLoad()
}

class JokePresenter: JokePresenterProtocol {
    
    private let category: String
    private var joke: Joke?
    
    init(category: String) {
        self.category = category
    }

    weak var view: JokeViewProtocol?

    func viewDidLoad() {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random?category=\(category)") else {return}
        let request = URLRequest(
            url: url
        )
        URLSession.shared.dataTask(
            with: request
        ) { data, response, error in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            let joke = try? decoder.decode(Joke.self, from: data)
            self.joke = joke
        }.resume()
    }
}
