//
//  Service.swift
//  ios-api-explorer-mvvm-swift
//
//  Created by otavio brito on 20/1/2026.
//

import Foundation


/// API Service
final class Service {
    /// Shared singleton instance
    static let shared = Service()
    
    /// Privatized constructor
    private init() {}
    
    enum ServiceError: Error {
        case failedRequest
        case fileError
    }
    
    /// Send API Call
    /// - Parameters
    /// - request: Request instance
    /// - type: The type of object we expect to get back
    /// - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: Request,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ){
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(ServiceError.failedRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? ServiceError.fileError))
                return
            }
            
            // Decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    
    // MARK: - Private
    
    private func request(from Request: Request) -> URLRequest? {
        guard let url = Request.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = Request.httpMethod
        return request
    }
        
}

