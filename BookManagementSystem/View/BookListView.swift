//
//  BookListView.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/19.
//

import SwiftUI

struct BookListView: View {
    @State private var selectedBook: Book?
    
    let books: [Book] = [
        Book(title: "Book 1", author: "Author 1", publicationYear: 2020, isbn: "1234567890"),
        Book(title: "Book 2", author: "Author 2", publicationYear: 2018, isbn: "0987654321"),
        Book(title: "Book 3", author: "Author 3", publicationYear: 2022, isbn: "4567890123"),
        Book(title: "Book 4", author: "Author 4", publicationYear: 2019, isbn: "9876543210"),
        Book(title: "Book 5", author: "Author 5", publicationYear: 2021, isbn: "3210987654"),
        Book(title: "Book 6", author: "Author 6", publicationYear: 2017, isbn: "5678901234"),
        Book(title: "Book 7", author: "Author 7", publicationYear: 2023, isbn: "4321098765"),
        Book(title: "Book 8", author: "Author 8", publicationYear: 2016, isbn: "8901234567"),
        Book(title: "Book 9", author: "Author 9", publicationYear: 2024, isbn: "7654321098"),
        Book(title: "Book 10", author: "Author 10", publicationYear: 2015, isbn: "2109876543")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(books) { book in
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
    }
}

#Preview {
    BookListView()
}
