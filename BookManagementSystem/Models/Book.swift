//
//  Book.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/19.
//

import Foundation

struct Book: Identifiable, Codable {
    var id: Int64?
    var title: String
    var author: String
    var publicationYear: String
    var isbn: String
}
