//
//  BookListRow.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/20.
//

import SwiftUI

struct BookListRow: View {
    //    @State private var book: Book
    @ObservedObject
    var viewModel: BookListRowViewModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Title: \(viewModel.book.title)").font(.headline)
                Text("Author: \(viewModel.book.author)").font(.subheadline)
                Text("Publication Year: \(viewModel.book.publicationYear)").font(.subheadline)
                Text("ISBN: \(viewModel.book.isbn)").font(.subheadline)
            }
            Spacer()
            VStack(alignment: .leading) {
                Button(action: {
                    // Add button action
                    // Perform the desired action here
                }) {
                    Image(systemName: "book.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                Button(action: {
                    // Add button action
                    // Perform the desired action here
                }) {
                    Image(systemName: "pencil.circle.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                .padding(.leading, 4)
                Button(action: {
                    // Add button action
                    // Perform the desired action here
                }) {
                    Image(systemName: "trash.slash.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                .padding(.leading, 4)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
    }
}

#Preview {
    BookListRow(viewModel: BookListRowViewModel(book: Book(title: "Book 1", author: "Author 1", publicationYear: 2020, isbn: "1234567890")))
}
