//
//  BookListViewModel.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/20.
//

import Foundation

class BookListModel: ObservableObject {
    @Published var books: [Book]
    let service: BookService
    
    
    init(
        books: [Book],
        service: BookService = DefaultBookService()
    ) {
        self.books = books
        self.service = service
    }
    
    func fetchAllBooks() async {
        books = await service.fetchAllBooks()
    }
}
