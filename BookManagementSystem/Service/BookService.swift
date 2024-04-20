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
}

class DefaultBookService: BookService {
    
    func fetchAllBooks() async throws -> [Book] {
        return mockBooks
    }
    
    func deleteBookBy(id: String) async throws -> Bool {
        mockBooks.removeAll{ $0.id == id }
        return true
    }
    
    
}
