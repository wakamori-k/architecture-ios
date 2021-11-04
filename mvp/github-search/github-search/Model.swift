//
//  Model.swift
//  github-search
//
//  Created by 若森和昌 on 2021/11/04.
//

import Foundation

enum searchUserError: Error {
    case clientError
    case noResponseData
    case invalidStatusCode
    case invalidResponse
    case notFound
}

protocol ModelInput {
    func searchUser(login: String,
                    completion: @escaping (Result<User, searchUserError>) -> () )
}

final class Model: ModelInput {
    func searchUser(login: String,
                    completion: @escaping (Result<User, searchUserError>) -> ()) {
        let urlString = "https://api.github.com/users/\(login)"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.clientError))
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse else {
                completion(.failure(.noResponseData))
                return
            }
            
            guard response.statusCode == 200 else {
                switch response.statusCode {
                case 404:
                    completion(.failure(.notFound))
                default:
                    completion(.failure(.invalidStatusCode))
                }
                return
            }
            
            let decoder = JSONDecoder()
            guard let user = try? decoder.decode(User.self, from: data) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            completion(.success(user))
        }
        
        task.resume()
    }
}
