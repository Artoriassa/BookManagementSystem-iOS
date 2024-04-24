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
}

class NetworkManager {
    private let baseURL = "http://localhost:8080"
    static let shared = NetworkManager()
    private init() {}

    func getAllBooks(completion: @escaping (Result<[Book], Error>) -> Void) {
        let urlString = "\(baseURL)/books"

        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let books = try decoder.decode([Book].self, from: data)
                completion(.success(books))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func getBookByIsbn(_ isbn: String, completion: @escaping ([Book], Error?) -> Void) {
            guard let url = URL(string: "\(baseURL)/books/\(isbn)") else {
                completion([], NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
                return
            }

            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion([], error)
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    completion([], NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid response"]))
                    return
                }

                if let data = data {
                    do {
                        let books = try JSONDecoder().decode([Book].self, from: data)
                        completion(books, nil)
                    } catch {
                        completion([], error)
                    }
                } else {
                    completion([], NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                }
            }

            task.resume()
        }
    
    func createBook(book: Book, completion: @escaping (Book?, Error?) -> Void) {
            guard let url = URL(string: "\(baseURL)/books") else {
                completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
                return
            }

            let requestBody: [String: Any] = [
                "id": book.id,
                "title": book.title,
                "author": book.author,
                "publicationYear": book.publicationYear,                
                "isbn": book.isbn
            ]

            guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
                completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to serialize request body"]))
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData

            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(nil, error)
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid response"]))
                    return
                }

                if let data = data {
                    do {
                        let book = try JSONDecoder().decode(Book.self, from: data)
                        completion(book, nil)
                    } catch {
                        completion(nil, error)
                    }
                } else {
                    completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                }
            }

            task.resume()
        }
    
    func updateBook(book: Book, completion: @escaping (Book?, Error?) -> Void) {
            guard let url = URL(string: "\(baseURL)/books/\(book.id)") else {
                completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
                return
            }

            let requestBody: [String: Any] = [
                "id": book.id,
                "title": book.title,
                "author": book.author,
                "publicationYear": book.publicationYear,
                "isbn": book.isbn
            ]

            guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
                completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to serialize request body"]))
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData

            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(nil, error)
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid response"]))
                    return
                }

                if let data = data {
                    do {
                        let updatedBook = try JSONDecoder().decode(Book.self, from: data)
                        completion(updatedBook, nil)
                    } catch {
                        completion(nil, error)
                    }
                } else {
                    completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                }
            }
            task.resume()
        }
    
    func deleteBook(withID id: String, completion: @escaping (Error?) -> Void) {
        guard let url = URL(string: "\(baseURL)/books/\(id)") else {
            completion(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        let task = URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let error = error {
                completion(error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid response"]))
                return
            }

            completion(nil)
        }
        task.resume()
    }
}
