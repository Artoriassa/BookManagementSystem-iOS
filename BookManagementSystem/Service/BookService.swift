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
    func deleteBookBy(id: Int64) async throws -> Bool
    func searchBooksBy(isbn: String) async throws -> [Book]
}

class DefaultBookService: BookService {
    private let networkManager: NetworkManager = NetworkManager.shared
    
    func fetchAllBooks() async throws -> [Book] {
        do {
            let books = try await networkManager.getAllBooks()
            return books
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    func createBook(book: Book) async throws -> Bool {
        do {
            _ = try await networkManager.createBook(book: book)
            return true
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    func updateBook(book: Book) async throws -> Bool {
        do {
            _ = try await networkManager.updateBook(book: book)
            return true
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    
    func deleteBookBy(id: Int64) async throws -> Bool {
        do {
            _ = try await networkManager.deleteBook(withID: id)
            return true
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    func searchBooksBy(isbn: String) async throws -> [Book] {
        do {
            return try await networkManager.getBooksByIsbn(isbn: isbn)
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
}
