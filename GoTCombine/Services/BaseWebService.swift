//
//  BaseWebService.swift
//  GoTCombine
//
//  Created by Jonathan Baird  on 26/03/2021.
//

import Foundation
import Combine

enum RequestError: Error {
        case serverError(URLError)
        case responseError
        case decodingError
        case badURL
}

public enum HttpMethod: String {
        case GET
        case POST
}

class BaseWebService {
    static let shared: BaseWebService = BaseWebService()
    
    public func call<T: Decodable>(_ urlString: String,
                                   with endpoint: String,
                                   method: HttpMethod) -> AnyPublisher<T, RequestError> {
        
        let urlRequest = request(for: urlString, with: endpoint, method: method)
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .mapError { error in
                return RequestError.serverError(error)
            }
            .tryMap({ (data, response) -> Data in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw RequestError.responseError
                }
                return data
            })
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { _ in RequestError.decodingError }
            .eraseToAnyPublisher()
    }
    
    private func request(for urlString: String, with endpoint: String, method: HttpMethod) -> URLRequest {
        let path = "\(urlString)\(endpoint)"
        guard let url = URL(string: path)
        else { fatalError("Bad URL") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "\(method)"
        return request
    }
}
