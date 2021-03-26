//
//  BaseWebService.swift
//  GoTCombine
//
//  Created by Jonathan Baird  on 26/03/2021.
//

import Foundation
import Combine

struct APIError: Decodable, Error {
    let statusCode: Int
}

class BaseWebService {
    
    static let shared: BaseWebService = BaseWebService()
    
    func fetchURL<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .tryMap({ result in
                let decoder = JSONDecoder()
                guard let httpResponse = result.response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    let apiError = try decoder.decode(APIError.self, from: result.data)
                    throw apiError
                }
                return try decoder.decode(T.self, from: result.data)
            })
            .eraseToAnyPublisher()
    }
}
