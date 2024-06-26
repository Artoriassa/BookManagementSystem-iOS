//
//  BookListRowViewModel.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/20.
//

import Foundation
enum BookListRowAlert {
    case readNotDeveloped
    case deleteConfirmation
}
@MainActor
class BookListRowViewModel: ObservableObject {
    @Published var book: Book
    @Published var deleted: Bool = false
    @Published var showAlert: Bool = false
    var alertType: BookListRowAlert = .readNotDeveloped
    private let service: BookService
    
    init(
        book: Book,
        service: BookService = DefaultBookService()
    ) {
        self.book = book
        self.service = service
    }
    
    func deleteThisBook() async {
        do {
            deleted = try await service.deleteBookBy(id: book.id!)
        } catch let error {
            print(error.localizedDescription)
            deleted = false
        }
    }
    
}
