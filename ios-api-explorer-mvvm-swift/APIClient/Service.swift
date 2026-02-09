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
    
    /// Send API Call
    /// - Parameters
    /// - request: Request instance
    /// - type: The type of object we expect to get back 
    /// - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: Request,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>
        ) -> Void) {
            
        }
        
    }


