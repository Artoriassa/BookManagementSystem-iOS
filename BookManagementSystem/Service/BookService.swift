//
//  BookService.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/20.
//

import Foundation
protocol BookService {
    func fetchAllBooks() async throws -> [Book]
    func deleteBookBy(id: String) async throws -> Bool
    func saveBook(book: Book) async throws -> Bool
}

class DefaultBookService: BookService {
    func saveBook(book: Book) async throws -> Bool {
        let targetIndex = mockBooks.firstIndex { $0.id == book.id }
        mockBooks[targetIndex!].title = book.title
        mockBooks[targetIndex!].author = book.author
        mockBooks[targetIndex!].publicationYear = book.publicationYear
        mockBooks[targetIndex!].isbn = book.isbn
        return true
    }
    
    
    func fetchAllBooks() async throws -> [Book] {
        return mockBooks
    }
    
    func deleteBookBy(id: String) async throws -> Bool {
        mockBooks.removeAll{ $0.id == id }
        return true
    }
    
    
}
