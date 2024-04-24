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
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                topView
                searchBar
                bookList
            }
        }
    }
    
    private var searchBar: some View {
        VStack(content: {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Search ISBN", text: $viewModel.searchText)
                    .onChange(of: viewModel.searchText, {
                        Task {
                            await viewModel.searchByISBN()
                        }
                    })
                    .foregroundColor(.black)
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
            Divider().padding(.top, 6)
        })
    }
    
    private var topView: some View {
        HStack(content: {
            Button(action: {}, label: {
                Image(systemName: "ellipsis")
                    .font(.title)
                    .foregroundColor(.blue)
            })
            Spacer()
            Text("Book List")
                .font(.title)
            Spacer()
            NavigationLink {
                CreateBookView(viewModel: CreateBookViewModel())
            } label: {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
                    .foregroundColor(.blue)
            }
        })
        .padding(.bottom, 12)
        .padding(.horizontal, 16)
        .background(Color.gray.opacity(0.2))
    }
    
    
    private var bookList: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(viewModel.books) { book in
                    VStack {
                        BookListRow(
                            viewModel: BookListRowViewModel(book: book),
                            ondelete: {
                                await viewModel.fetchAllBooks()
                            })
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Text("swiped!!!!!")
                        }
                        Divider()
                    }
                }
            }
        }
        .task { await viewModel.fetchAllBooks() }
    }
}

#Preview {
    BookListView()
}
