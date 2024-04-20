//
//  Book.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/19.
//

import Foundation

struct Book: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let publicationYear: Int
    let isbn: String
}
