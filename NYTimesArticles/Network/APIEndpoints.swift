//
//  APIEndpoints.swift
//  NYTimesArticles
//
//  Created by Hesham Mohammed on 28/06/2022.
//

import Alamofire

enum Constants: Int {
    case oneDay = 1
    case sevenDays = 7
    case thirtyDays = 30
}

enum APIEndpoints: URLRequestConvertible {
    case fetchArticles(period: Int = Constants.sevenDays.rawValue)
    
    var baseURL: String {
        return "https://api.nytimes.com/svc/"
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchArticles: return .get
        }
    }
    
    var path: String {
        switch self {
        case .fetchArticles(let period): return "mostpopular/v2/viewed/\(period).json"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents(string: baseURL + path)!
        urlComponents.queryItems = [
          URLQueryItem(name: "api-key", value: "CuBdPEJNERqoWE71OS7oMUxz6GwACfws")
        ]
        
        var request = URLRequest(url: urlComponents.url!)
        request.method = method

        return request
    }
}
