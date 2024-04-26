//
//  DevelopingViewModel.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/26.
//

import Foundation

@MainActor
class DevelopingViewModel: ObservableObject {
    private let service: BookService
    
    init(
        service: BookService = DefaultBookService()
    ) {
        self.service = service
    }
    
    func addSampleBooks() async {
        await withTaskGroup(of: Void.self) { group in
            for book in sampleBooks {
                group.addTask {
                    do {
                        _ = try await self.service.createBook(book: book)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}
