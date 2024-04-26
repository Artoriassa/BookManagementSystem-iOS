//
//  Book.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/19.
//

import Foundation

struct Book: Identifiable, Codable {
    var id: Int64?
    var title: String
    var author: String
    var publicationYear: String
    var isbn: String
}

let sampleBooks = [
    Book(title: "Nicomachean Ethics", author: "Aristotle", publicationYear: "1999", isbn: "0023895306"),
    Book(title: "Kant: Groundwork of the Metaphysics of Morals", author: "Mary Gregor", publicationYear: "2012", isbn: "1107401062"),
    Book(title: "Utilitarianism", author: "John Stuart Mill", publicationYear: "2002", isbn: "087220605X"),
    Book(title: "Republic", author: "Plato", publicationYear: "2004", isbn: "0872207366"),
    Book(title: "Hard Times", author: "Charles Dickens", publicationYear: "2003", isbn: "0141439679"),
    Book(title: "Little Women", author: "Louisa May Alcott", publicationYear: "2021", isbn: "0143136208"),
    Book(title: "Heidi", author: "Johanna Spyri", publicationYear: "2014", isbn: "0147514029"),
    Book(title: "The Secret Garden", author: "Frances Hodgson Burnett", publicationYear: "2018", isbn: "1840227796"),
    Book(title: "Black Beauty", author: "Anna Sewell", publicationYear: "2018", isbn: "1840227877"),
    Book(title: "Jungle Book", author: "Rudyard Kipling", publicationYear: "2018", isbn: "1840227834")
]
