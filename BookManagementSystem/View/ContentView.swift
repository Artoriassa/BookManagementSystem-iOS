//
//  ContentView.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: .constant(1),
                content:  {
            MainView()
                .tabItem { Text("Main") }
                .tag(1)
            MeView()
                .tabItem { Text("Me") }
                .tag(2)
        })
    }
}

#Preview {
    ContentView()
}
