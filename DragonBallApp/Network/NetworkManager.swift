//
//  NetworkManager.swift
//  DragonBallApp
//
//  Created by Marco Guevara on 28/03/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}

class NetworkManager: NSObject, ObservableObject {
    static let shared = NetworkManager()
    
    static let baseURL = "https://dragonball-api.com/api/characters?page="
    
    func getListOfCharacters(pageNumber: Int, completion: @escaping (Result<CharacterResponse, APIError>) -> Void) {
        guard let url = URL(string: NetworkManager.baseURL+"\(pageNumber)"+"&limit=10") else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                debugPrint(error)
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(CharacterResponse.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                debugPrint("Debug: error \(error.localizedDescription)")
                completion(.failure(.decodingError))
            }
        }
        
        task.resume()
    }
}
