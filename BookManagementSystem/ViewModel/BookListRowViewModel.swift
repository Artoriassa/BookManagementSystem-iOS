//
//  BookListRowViewModel.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/20.
//

import Foundation

class BookListRowViewModel: ObservableObject {
    @Published var book: Book
    let service: BookService
    
    init(
        book: Book,
        service: BookService = DefaultBookService()
    ) {
        self.book = book
        self.service = service
    }
    
    
}
