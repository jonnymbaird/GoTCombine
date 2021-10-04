//
//  BooksWebService.swift
//  GoTCombine
//
//  Created by Jonathan Baird  on 26/03/2021.
//

import Foundation
import Combine

struct GoTWebService {
    private let baseURL: String = "https://anapioficeandfire.com/api"
    
    private enum Endpoint: String {
        case books = "/books"
        case house = "/houses"
        
        var objectType: Decodable.Type {
            switch self {
            case .books, .house:
                return Book.self
            }
        }
    }
    
    func getBooks() -> AnyPublisher<[Book], RequestError> {
        BaseWebService.shared.call(baseURL, with: Endpoint.books.rawValue, method: .GET)
    }
    
    func getThings(type: Endpoint)-> AnyPublisher<T, Error> {
        BaseWebService.shared.call(baseURL, with: type, method: <#T##HttpMethod#>)
    }
}



