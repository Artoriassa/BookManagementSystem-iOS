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
            VStack(alignment: .leading) {
                topView
                searchBar
                    .padding(.horizontal)
                bookList
            }
        }
    }
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search ISBN", text: $viewModel.searchText)
                .onChange(of: viewModel.searchText, {
                    Task {
                        await viewModel.searchByISBN()
                    }
                })
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                .foregroundColor(.black)
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 0))
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.gray.opacity(0.2))
        )
    }
    
    private var topView: some View {
        HStack(content: {
            Button(action: {}, label: {
                Image(systemName: "ellipsis")
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding(.leading, 16)
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
            .padding(.trailing, 16)
        })
        
    }
    
    
    private var bookList: some View {
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
