//
//  ViewController.swift
//  github-search
//
//  Created by 若森和昌 on 2021/11/04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var presenter: PresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        presenter = Presenter(view: self)
        searchBar.delegate = self
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.didTapSearchButton(text: searchBar.text)
    }
}

extension ViewController: PresenterOutput {
    
    func updateUser(user: User) {
        loginLabel.text = user.login
        nameLabel.text = user.name
        locationLabel.text = user.location
    }
    
    func notFoundError() {
        let alert = UIAlertController(title: "Not Found",
                                      message: "ユーザーが見つかりません",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "了解", style: .default, handler: nil))
        present(alert, animated: true)
    }

}
