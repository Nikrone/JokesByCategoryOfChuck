//
//  JokeViewController.swift
//  JokesByCategoryOfChuck
//
//  Created Evgeniy Nosko on 21.10.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
import SDWebImage

protocol JokeViewProtocol: AnyObject {
    func updateImageView()
    func updateJokeLabel(with joke: String)
}

class JokeViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!

    var presenter: JokePresenterProtocol!

	override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.view = self
        presenter.viewDidLoad()
    }

}

extension JokeViewController: JokeViewProtocol {
    func updateImageView() {
        imageView.sd_setImage(with: URL(string: "https://assets.chucknorris.host/img/avatar/chuck-norris.png"))
    }
    
    func updateJokeLabel(with joke: String) {
        textLabel.text = joke
    }
    
}
