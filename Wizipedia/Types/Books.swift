//
//  Books.swift
//  Wizipedia
//
//  Created by Tardes on 29/1/26.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let books = try? JSONDecoder().decode(Books.self, from: jsonData)

import Foundation

// MARK: - Book
struct Book: Codable {
    let serial, title, summary: String
    let releaseDate: String?
    let dedication, pages: String
    let cover: String
    let wiki: String
    let author: String?

    enum CodingKeys: String, CodingKey {
        case serial, title, summary
        case releaseDate = "release_date"
        case dedication, pages, cover, wiki, author
    }
}

typealias Books = [Book]
