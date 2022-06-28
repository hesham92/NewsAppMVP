//
//  ArticlesServiceProvider.swift
//  NYTimesArticles
//
//  Created by Hesham Mohammed on 28/06/2022.
//

import Foundation

protocol ArticlesServiceProviderProtocol {
    func fetchArticles(completion: @escaping (Result<ArticleResponse, APIError>) -> ())
}

class ArticlesServiceProvider: ArticlesServiceProviderProtocol {
    let network = Network()
    
    func fetchArticles(completion: @escaping (Result<ArticleResponse, APIError>) -> ()) {
        network.request(APIEndpoints.fetchArticles(), modelType:  ArticleResponse.self) {response in
            completion(response)
        }
    }
}
