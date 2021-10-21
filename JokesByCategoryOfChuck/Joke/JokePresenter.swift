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

    weak var view: JokeViewProtocol?

    func viewDidLoad() {

    }
}
