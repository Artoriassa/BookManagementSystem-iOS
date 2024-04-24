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
    func searchBooksBy(isbn: String) async throws -> [Book]
}

class DefaultBookService: BookService {
    private let networkManager: NetworkManager = NetworkManager.shared
    func fetchAllBooks() async throws -> [Book] {
        return mockBooks
//        var expectedBooks: [Book] = []
//        networkManager.getAllBooks { result in
//            switch result {
//            case .success(let books):
//                expectedBooks = books
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//        return expectedBooks
    }
    
    func createBook(book: Book) async throws -> Bool {
        mockBooks.insert(book, at: 0)
        return true
//        var result: Bool = false
//        networkManager.createBook(book: book) { book, error in
//            if let error = error {
//                    print("Error creating book: \(error)")
//                result = false
//                } else if let book = book {
//                    result = true
//                    print("Book created successfully:")
//                    print("Title: \(book.title), Author: \(book.author)")
//                }
//        }
//        return result
    }
    
    func updateBook(book: Book) async throws -> Bool {
        let targetIndex = mockBooks.firstIndex { $0.id == book.id }
        mockBooks[targetIndex!].title = book.title
        mockBooks[targetIndex!].author = book.author
        mockBooks[targetIndex!].publicationYear = book.publicationYear
        mockBooks[targetIndex!].isbn = book.isbn
        return true

//        var result = false
//        networkManager.updateBook(book: book) { (updatedBook, error) in
//            if let error = error {
//                print("Error updating book: \(error)")
//            } else if let updatedBook = updatedBook {
//                result = true
//                print("Book updated successfully:")
//                print("Title: \(updatedBook.title), Author: \(updatedBook.author)")
//            }
//        }
//        return result
    }
    
    
    func deleteBookBy(id: String) async throws -> Bool {
        mockBooks.removeAll{ $0.id == id }
        return true
//        var result = false
//        networkManager.deleteBook(withID: id) { (error) in
//            if let error = error {
//                print("Error deleting book: \(error)")
//            } else {
//                result = true
//                print("Book deleted successfully")
//            }
//        }
//        return result
    }
    
    func searchBooksBy(isbn: String) async throws -> [Book] {
        return mockBooks.filter { $0.isbn.contains(isbn) }
//        var expectedBooks: [Book] = []
//        networkManager.getBookByIsbn(isbn) { (books, error) in
//            if let error = error {
//                print("Error retrieving book: \(error)")
//            } else if !books.isEmpty {
//                expectedBooks = books
//            }
//        }
//        return expectedBooks
    }
}
