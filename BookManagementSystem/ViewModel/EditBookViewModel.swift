//
//  EditBookViewModel.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/20.
//

import Foundation

@MainActor
class EditBookViewModel: ObservableObject {
    @Published var book: Book
    var updatedSuccess: Bool = false
    private let service: BookService
    
    init(
        book: Book,
        service: BookService = DefaultBookService()
    ) {
        self.book = book
        self.service = service
    }
    
    func saveBook() async {
        do {
            updatedSuccess = try await service.saveBook(book: book)
        } catch let error {
            print(error.localizedDescription)
            updatedSuccess = false
        }
    }
}
