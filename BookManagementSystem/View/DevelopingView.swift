//
//  DevelopingView.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/24.
//

import SwiftUI

struct DevelopingView: View {
    @ObservedObject
    var viewModel = DevelopingViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("This is just a demo, there are fundamental creating, updating, deleting(long pressing a book), searching features in this APP")
        }
        Button(action: {
            Task {
                await viewModel.addSampleBooks()
            }
        }, label: {
            Text("add sample books")
        })
        Spacer()
        .padding(.horizontal, 16)
        .navigationTitle("Developing Page")
    }
}

#Preview {
    DevelopingView()
}
