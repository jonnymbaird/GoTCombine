//
//  BooksViewModel.swift
//  GoTCombine
//
//  Created by Jonathan Baird  on 19/03/2021.
//

import Foundation
import Combine

class BooksViewModel {
    private var subscriptions = Set<AnyCancellable>()
    
    var webService: BooksWebService = BooksWebService()
    var books: [Book] = []
    
    init() {
        setup()
    }
    
    private func setup() {
        webService.getBooks()
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { (books: [Book]) in
                self.books = books
            }).store(in: &subscriptions)
    }
}
