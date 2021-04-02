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
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
    
    let name: String
    let numberOfPages: Int
    let released: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.name == rhs.name
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case numberOfPages
        case released
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.numberOfPages = try container.decode(Int.self, forKey: .numberOfPages)
        let dateString = try container.decode(String.self, forKey: .released)
        Book.dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        self.released = Book.dateFormatter.date(from: dateString) ?? Date()
    }
    
}

extension Book {
    var displayModel: BookDisplayModel {
        Book.dateFormatter.locale = Locale(identifier: "en_GB")
        Book.dateFormatter.setLocalizedDateFormatFromTemplate("MMMyyyy")
        return BookDisplayModel(name: name,
                                numberofPages: "\(numberOfPages) pages",
                                date: Book.dateFormatter.string(from: released))
    }
}

struct BookDisplayModel {
    let name: String
    let numberofPages: String
    let date: String
}
