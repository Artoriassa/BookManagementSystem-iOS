//
//  NetworkManager.swift
//  BookManagementSystem
//
//  Created by Junjie Huang on 2024/4/24.
//

import Foundation
enum NetworkError: Error {
    case invalidURL
    case invalidData
    case requestFailed
    case invalidResponse
    case decodingFailed
}

class NetworkManager {
    private let baseURL = "http://localhost:8080"
    static let shared = NetworkManager()
    private init() {}
    
    func getAllBooks() async throws -> [Book] {
        let url = URL(string: "\(baseURL)/books")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        do {
            let books = try decoder.decode([Book].self, from: data)
            return books
        } catch {
            throw NetworkError.decodingFailed
        }
    }
    
    func getBooksByIsbn(isbn: String) async throws -> [Book] {
        let url = URL(string: "\(baseURL)/books?isbn=\(isbn)")!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailed
        }
        
        let decoder = JSONDecoder()
        do {
            let books = try decoder.decode([Book].self, from: data)
            return books
        } catch {
            throw NetworkError.decodingFailed
        }
    }
    
    func createBook(book: Book) async throws -> Book {
        let url = URL(string: "\(baseURL)/books")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        let requestData = try encoder.encode(book)
        request.httpBody = requestData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailed
        }
        
        let decoder = JSONDecoder()
        do {
            let createdBook = try decoder.decode(Book.self, from: data)
            return createdBook
        } catch {
            throw NetworkError.decodingFailed
        }
    }
    
    func updateBook(book: Book) async throws -> Book {
        let url = URL(string: "\(baseURL)/books/\(book.id!)")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        let encoder = JSONEncoder()
        let requestData = try encoder.encode(book)
        request.httpBody = requestData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailed
        }
        
        let decoder = JSONDecoder()
        do {
            let updatedBook = try decoder.decode(Book.self, from: data)
            return updatedBook
        } catch {
            throw NetworkError.decodingFailed
        }
    }
    
    func deleteBook(withID id: Int64) async throws {
        let url = URL(string: "\(baseURL)/books/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 204 else {
            throw NetworkError.requestFailed
        }
    }
}
