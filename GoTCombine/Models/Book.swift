//
//  Book.swift
//  GoTCombine
//
//  Created by Jonathan Baird  on 26/03/2021.
//

import Foundation

/**
 An API of IceAndFire Book. [API Documentation](https://anapioficeandfire.com/Documentation#books)
 */

struct Book: Decodable, Hashable {
    let name: String
    let numberOfPages: Int
    let released: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.name == rhs.name
    }
    
}

extension Book {
    var displayModel: BookDisplayModel {
        return BookDisplayModel(name: self.name, numberofPages: "\(numberOfPages) pages", date: released)
    }
}

struct BookDisplayModel {
    let name: String
    let numberofPages: String
    let date: String
}
