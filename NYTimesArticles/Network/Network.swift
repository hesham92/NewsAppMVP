//
//  Network.swift
//  NYTimesArticles
//
//  Created by Hesham Mohammed on 28/06/2022.
//

import Foundation
import Alamofire

class Network {
    func request<ModelType: Codable>(_ endpoint: APIEndpoints, modelType: ModelType.Type,responseData: @escaping (Result<ModelType, APIError>) -> Void) {
        let request = AF.request(endpoint)
        request.responseDecodable(of: modelType) {(response) in
            guard let response = response.value else {
                responseData(Result.failure(APIError(error: response.error!)))
                return
            }
            responseData(Result.success(response))
        }
    }
}

extension APIError {
    init(error: AFError) {
        self = .apiError
    }
}

enum APIError: Error {
    case apiError
    var message: String {
        switch self {
        case .apiError:
            return "Server Error"
        }
    }
}
