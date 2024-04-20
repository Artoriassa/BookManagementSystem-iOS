//
//  Book.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/19.
//

import Foundation

struct Book: Identifiable {
    let id: String
    var title: String
    var author: String
    var publicationYear: Int
    var isbn: String
}

var mockBooks = [
    Book(id: "9f113742-87ca-4568-a667-fd678f59730f", title: "Book 1", author: "Author 1", publicationYear: 2020, isbn: "1234567890"),
    Book(id: "845b6365-c6f2-4075-869f-e82bbedc0066", title: "Book 2", author: "Author 2", publicationYear: 2018, isbn: "0987654321"),
    Book(id: "8e2da6df-820d-4175-98ba-971fa533eb35", title: "Book 3", author: "Author 3", publicationYear: 2022, isbn: "4567890123"),
    Book(id: "6f19d1bf-2937-4878-88f2-62417b503d18", title: "Book 4", author: "Author 4", publicationYear: 2019, isbn: "9876543210"),
    Book(id: "26629376-67a5-407d-ae72-b18b11cce429", title: "Book 5", author: "Author 5", publicationYear: 2021, isbn: "3210987654"),
    Book(id: "9778a591-7de1-466a-94df-61b9587431c1", title: "Book 6", author: "Author 6", publicationYear: 2017, isbn: "5678901234"),
    Book(id: "eab37155-6220-4ea1-bf8d-27691097201f", title: "Book 7", author: "Author 7", publicationYear: 2023, isbn: "4321098765"),
    Book(id: "10e9a605-7fe5-4a0a-b489-4ba7c108bc08", title: "Book 8", author: "Author 8", publicationYear: 2016, isbn: "8901234567"),
    Book(id: "810bb867-f716-4e51-a16b-015d07872349", title: "Book 9", author: "Author 9", publicationYear: 2024, isbn: "7654321098"),
    Book(id: "06a9e82a-b7e6-4b67-bf78-0bd3561af70e", title: "Book 10", author: "Author 10", publicationYear: 2015, isbn: "2109876543")
]
