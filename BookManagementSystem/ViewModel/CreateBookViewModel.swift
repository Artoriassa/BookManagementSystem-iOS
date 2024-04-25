//
//  CreateBookViewModel.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/20.
//

import Foundation
@MainActor
class CreateBookViewModel: ObservableObject {
    @Published var book: Book
    var saveSuccess: Bool = false
    private let service: BookService
    
    init(
        book: Book = .init(title: "", author: "", publicationYear: "", isbn: ""),
        service: BookService = DefaultBookService()
    ) {
        self.book = book
        self.service = service
    }
    
    func saveBook() async {
        do {
            saveSuccess = try await service.createBook(book: book)
        } catch let error {
            print(error.localizedDescription)
            saveSuccess = false
        }
    }
}
