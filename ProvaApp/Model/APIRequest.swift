//
//  APIRequest.swift
//  ProvaApp
//
//  Created by Fabio Graciotti on 04/02/22.
//


import Foundation

class APIRequest<T: Decodable> {
    let url: URL
    
    init(urlString: String) {
        url = URL(string: urlString)!
    }
    
    func perform(with completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.transportError(error)))
                return
            }
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(.failure(.serverError(statusCode: response.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                let json = try decoder.decode(T.self, from: data)
                completion(.success(json))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case transportError(Error)
    case serverError(statusCode: Int)
    case noData
    case decodingError(Error)
    case encodingError(Error)
}
