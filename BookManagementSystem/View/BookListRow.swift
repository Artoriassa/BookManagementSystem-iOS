//
//  BookListRow.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/20.
//

import SwiftUI

struct BookListRow: View {
    @ObservedObject
    var viewModel: BookListRowViewModel
    let ondelete: () async -> Void
    var body: some View {
        HStack {
            Image(systemName: "book.closed.fill")
                .resizable()
                .frame(width: 60, height: 80)
                .foregroundColor(.primary)
                .padding(.trailing, 8)
            VStack(alignment: .leading) {
                Text("Title: \(viewModel.book.title)").font(.headline).lineLimit(1)
                Text("Author: \(viewModel.book.author)").font(.subheadline)
                Text("Publication Year: \(viewModel.book.publicationYear)").font(.subheadline)
                Text("ISBN: \(viewModel.book.isbn)").font(.subheadline)
            }
            Spacer()
            buttonMenu
        }
        .padding(.top, 8)
        .padding(.bottom, 4)
        .padding(.horizontal, 16)
        .alert(isPresented: $viewModel.showAlert, content: {
            alertView
        })
        .contextMenu(ContextMenu(menuItems: {
            Button(action: {
                viewModel.alertType = .deleteConfirmation
                viewModel.showAlert = true
            }) {
                Text("Remove book")
                Image(systemName: "trash.slash.fill")
                    .font(.title)
                    .foregroundColor(.red)
            }
        }))
    }
    
    private var buttonMenu: some View {
        VStack(alignment: .leading, spacing: 8) {
            Button(action: {
                viewModel.alertType = .readNotDeveloped
                viewModel.showAlert = true
            }) {
                Image(systemName: "book.fill")
                    .font(.title)
                    .foregroundColor(.blue)
            }
            NavigationLink {
                EditBookView(viewModel: EditBookViewModel(book: viewModel.book))
            } label: {
                Image(systemName: "pencil.circle.fill")
                    .font(.title)
                    .foregroundColor(.blue)
            }
            .padding(.leading, 4)
        }
    }
    
    private var alertView: Alert {
        switch viewModel.alertType {
        case .readNotDeveloped:
            return Alert(title: Text("read feature not developed yet"))
        case .deleteConfirmation:
            return Alert(
                title: Text("Remove \(viewModel.book.title)?"),
                message: Text("Removing from book list will mark this book not accessible"),
                primaryButton: .destructive(Text("Delete"), action: {
                    Task {
                        await viewModel.deleteThisBook()
                        await ondelete()
                    }
                }),
                secondaryButton: .cancel())
        }
    }
}
