//
//  JokeViewController.swift
//  JokesByCategoryOfChuck
//
//  Created Evgeniy Nosko on 21.10.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

protocol JokeViewProtocol: AnyObject {
    
}

class JokeViewController: UIViewController {

    var presenter: JokePresenterProtocol!

	override func viewDidLoad() {
        super.viewDidLoad()

        presenter.view = self
        presenter.viewDidLoad()
    }

}

extension JokeViewController: JokeViewProtocol {
    
}
