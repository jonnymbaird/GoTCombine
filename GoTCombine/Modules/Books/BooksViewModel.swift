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
    
    var webService: GoTWebService = GoTWebService()
    var books = CurrentValueSubject<[Book], Never>([])
    
    init() {
        getBooks()
    }
    
    func getBooks() {
        webService.getBooks()
            .catch({ error -> Just<[Book]> in
                print("getBooks error occured: \(error)")
                return Just([])
            })
            .sink(receiveValue: { (books: [Book]) in
                self.books.value = books
            })
            .store(in: &subscriptions)
    }
}
