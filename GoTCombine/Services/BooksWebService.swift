//
//  BooksWebService.swift
//  GoTCombine
//
//  Created by Jonathan Baird  on 26/03/2021.
//

import Foundation
import Combine

struct BooksWebService {

    func getBooks() -> AnyPublisher<[Book], Error> {
        let url = Constants.baseURL.appendingPathComponent("/books")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let publisher: AnyPublisher<[Book], Error> = BaseWebService.shared.fetchURL(request)
        
        return publisher
    }
}
