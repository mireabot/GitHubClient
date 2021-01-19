//
//  GithubUserViewModel.swift
//  GitDemo
//
//  Created by Mikhail Kolkov on 14.01.21.

import Foundation

class GithubUserViewModel: NSObject{
    
    let network = NetworkManager.shared
    
    func fetchGitHubUserData(completion: @escaping ([Item]) -> ()) {
        network.request(endpoint: GithubEndPoints.getSearchResults(searchName ?? defaultSearchName, page: pageItems)) { (result: Result<GithubUserModel, Error>) in
            switch result {
            case .success(let response):
                completion(response.items)
            case .failure(let error):
                print(error)
            }
        }
    }
}
