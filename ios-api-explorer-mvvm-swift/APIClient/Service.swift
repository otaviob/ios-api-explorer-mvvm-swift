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
    /// - completion: Call with data error
    
    public func execute(_ request: Request, completion: @escaping () -> Void) {
        
    }
}

