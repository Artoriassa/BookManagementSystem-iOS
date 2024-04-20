//
//  BookService.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/20.
//

import Foundation
protocol BookService {
    func fetchAllBooks() async throws -> [Book]
    func createBook(book: Book) async throws -> Bool
    func updateBook(book: Book) async throws -> Bool
    func deleteBookBy(id: String) async throws -> Bool
}

class DefaultBookService: BookService {
    
    func fetchAllBooks() async throws -> [Book] {
        return mockBooks
    }
    
    func createBook(book: Book) async throws -> Bool {
        mockBooks.insert(book, at: 0)
        return true
    }
    
    func updateBook(book: Book) async throws -> Bool {
        let targetIndex = mockBooks.firstIndex { $0.id == book.id }
        mockBooks[targetIndex!].title = book.title
        mockBooks[targetIndex!].author = book.author
        mockBooks[targetIndex!].publicationYear = book.publicationYear
        mockBooks[targetIndex!].isbn = book.isbn
        return true
    }
    
    
    func deleteBookBy(id: String) async throws -> Bool {
        mockBooks.removeAll{ $0.id == id }
        return true
    }
    
    
}
