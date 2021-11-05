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
    func reloadData()
    func reloadTableView()
    func showAlert()
}


class CategoriesViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: CategoriesPresenterProtocol = CategoriesPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.view = self
        presenter.viewDidLoad()
        tableView.register(UINib(nibName: "CustomCellTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
}

extension CategoriesViewController: CategoriesViewProtocol {
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func reloadData() {
        activityIndicator.isHidden = true
        tableView.reloadData()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Category query error", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
    }


}

// MARK: - Table View
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfCategories()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCellTableViewCell
        cell.titleCell.text = presenter.category(for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let jokeVC = UIStoryboard(name: "Joke", bundle: Bundle.main).instantiateViewController(withIdentifier: "JokeViewController") as? JokeViewController else { return }
        jokeVC.presenter = JokePresenter(category: presenter.category(for: indexPath))
        navigationController?.pushViewController(jokeVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
