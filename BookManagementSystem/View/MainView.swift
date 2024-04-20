//
//  MainView.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/19.
//

import SwiftUI

struct MainView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    searchBar
                    addButton
                }
                .padding(.horizontal)
                BookListView()
            }            
        }
    }
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search", text: $searchText)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                .foregroundColor(.black)
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 0))
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.gray.opacity(0.2))
        )
    }
    
    private var addButton: some View {
        Button(action: {
            // Add button action
            // Perform the desired action here
        }) {
            Image(systemName: "plus.circle.fill")
                .font(.title)
                .foregroundColor(.blue)
        }
        .padding(.trailing, 16)
    }
    
}



#Preview {
    MainView()
}
