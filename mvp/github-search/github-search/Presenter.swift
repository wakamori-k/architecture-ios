//
//  Presenter.swift
//  github-search
//
//  Created by 若森和昌 on 2021/11/04.
//

import Foundation

protocol PresenterInput {
    func didTapSearchButton(text: String?)
}

protocol PresenterOutput: AnyObject {
    func updateUser(user: User)
    func notFoundError()
}

final class Presenter: PresenterInput {
    private weak var view: PresenterOutput!
    private var model: ModelInput!
    
    init(view: PresenterOutput, model: ModelInput = Model()) {
        self.view = view
        self.model = model
    }
    func didTapSearchButton(text: String?) {
        guard let text = text else {
            return
        }
        
        model.searchUser(login: text) { [weak self] result in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self?.view.updateUser(user: user)
                }
            case .failure(let error):
                switch error {
                case .notFound:
                    DispatchQueue.main.async {
                        self?.view.notFoundError()
                    }
                default: break
                }
            }
        }
    }
}
