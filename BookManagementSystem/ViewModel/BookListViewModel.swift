//
//  BookListViewModel.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/20.
//

import Foundation

@MainActor
class BookListModel: ObservableObject {
    @Published var books: [Book]
    let service: BookService
    @Published var searchText: String = ""
    
    init(
        books: [Book],
        service: BookService = DefaultBookService()
    ) {
        self.books = books
        self.service = service
    }
    
    func fetchAllBooks() async {
        do {
            books = try await service.fetchAllBooks()
            print("fetched all books📚📚📚📚📚")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func searchByISBN() async {
        do {
            if searchText != "" {
                books = try await service.searchBooksBy(isbn: searchText)
            } else {
                books = try await service.fetchAllBooks()
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
}
