//
//  BookListView.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/19.
//

import SwiftUI

struct BookListView: View {
    @ObservedObject
    var viewModel = BookListModel(books: [])
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(viewModel.books) { book in
                    BookListRow(
                        viewModel: BookListRowViewModel(book: book),
                        ondelete: {
                            await viewModel.fetchAllBooks()
                        })
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
        .task { await viewModel.fetchAllBooks() }
    }
}

#Preview {
    BookListView()
}
