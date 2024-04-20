//
//  CreateBookView.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/20.
//

import SwiftUI

struct CreateBookView: View {
    @ObservedObject
    var viewModel: CreateBookViewModel
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        Form(content: {
            TextField("Title", text: $viewModel.book.title)
            TextField("Author", text: $viewModel.book.author)
            TextField("Publication Year", text: $viewModel.book.publicationYear)
            TextField("ISBN", text: $viewModel.book.isbn)
            Button {
                Task {
                    await viewModel.saveBook()
                    dismiss()
                }
            } label: {
                Text("Create")
                    .foregroundColor(.blue)
            }
        })
        .navigationTitle("Create Book")
    }
}
