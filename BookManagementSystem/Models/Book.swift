//
//  Book.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/19.
//

import Foundation

struct Book: Identifiable, Codable {
    let id: String
    var title: String
    var author: String
    var publicationYear: String
    var isbn: String
}

var mockBooks = [
    Book(id: "9f113742-87ca-4568-a667-fd678f59730f", title: "Nicomachean Ethics", author: "Aristotle", publicationYear: "1999", isbn: "0023895306"),
    Book(id: "845b6365-c6f2-4075-869f-e82bbedc0066", title: "Kant: Groundwork of the Metaphysics of Morals", author: "Mary Gregor", publicationYear: "2012", isbn: "1107401062"),
    Book(id: "8e2da6df-820d-4175-98ba-971fa533eb35", title: "Utilitarianism", author: "John Stuart Mill", publicationYear: "2002", isbn: "087220605X"),
    Book(id: "6f19d1bf-2937-4878-88f2-62417b503d18", title: "Republic", author: "Plato", publicationYear: "2004", isbn: "0872207366"),
    Book(id: "26629376-67a5-407d-ae72-b18b11cce429", title: "Hard Times", author: "Charles Dickens", publicationYear: "2003", isbn: "0141439679"),
    Book(id: "9778a591-7de1-466a-94df-61b9587431c1", title: "Little Women", author: "Louisa May Alcott", publicationYear: "2021", isbn: "0143136208"),
    Book(id: "eab37155-6220-4ea1-bf8d-27691097201f", title: "Heidi", author: "Johanna Spyri", publicationYear: "2014", isbn: "0147514029"),
    Book(id: "10e9a605-7fe5-4a0a-b489-4ba7c108bc08", title: "The Secret Garden", author: "Frances Hodgson Burnett", publicationYear: "2018", isbn: "1840227796"),
    Book(id: "810bb867-f716-4e51-a16b-015d07872349", title: "Black Beauty", author: "Anna Sewell", publicationYear: "2018", isbn: "1840227877"),
    Book(id: "06a9e82a-b7e6-4b67-bf78-0bd3561af70e", title: "Jungle Book", author: "Rudyard Kipling", publicationYear: "2018", isbn: "1840227834")
]
