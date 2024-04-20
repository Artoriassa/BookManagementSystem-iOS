//
//  BookListView.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/19.
//

import SwiftUI

struct BookListView: View {
    @State private var selectedBook: Book?
    @ObservedObject
    var viewModel = BookListModel(books: [])
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(viewModel.books) { book in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Title: \(book.title)")
                                .font(.headline)
                            
                            Text("Author: \(book.author)")
                                .font(.subheadline)
                            
                            Text("Publication Year: \(book.publicationYear)")
                                .font(.subheadline)
                            
                            Text("ISBN: \(book.isbn)")
                                .font(.subheadline)
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
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
        .task { await viewModel.fetchAllBooks() }
    }
}

#Preview {
    BookListView()
}
