//
//  BookService.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/20.
//

import Foundation
protocol BookService {
    func fetchAllBooks() async -> [Book]
}

class DefaultBookService: BookService {
    let mockBooks = [
        Book(title: "Book 1", author: "Author 1", publicationYear: 2020, isbn: "1234567890"),
        Book(title: "Book 2", author: "Author 2", publicationYear: 2018, isbn: "0987654321"),
        Book(title: "Book 3", author: "Author 3", publicationYear: 2022, isbn: "4567890123"),
        Book(title: "Book 4", author: "Author 4", publicationYear: 2019, isbn: "9876543210"),
        Book(title: "Book 5", author: "Author 5", publicationYear: 2021, isbn: "3210987654"),
        Book(title: "Book 6", author: "Author 6", publicationYear: 2017, isbn: "5678901234"),
        Book(title: "Book 7", author: "Author 7", publicationYear: 2023, isbn: "4321098765"),
        Book(title: "Book 8", author: "Author 8", publicationYear: 2016, isbn: "8901234567"),
        Book(title: "Book 9", author: "Author 9", publicationYear: 2024, isbn: "7654321098"),
        Book(title: "Book 10", author: "Author 10", publicationYear: 2015, isbn: "2109876543")
    ]
    func fetchAllBooks() async -> [Book] {
        return mockBooks
    }
    
}
