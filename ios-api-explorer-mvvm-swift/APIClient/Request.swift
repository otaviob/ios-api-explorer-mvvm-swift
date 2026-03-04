//
//  Request.swift
//  ios-api-explorer-mvvm-swift
//
//  Created by otavio brito on 20/1/2026.
//

import Foundation

/// Object that represents a single API Call
final class Request {
    
    /// API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint
    let endpoint: Endpoint
    
    /// Path components for API, if any
    let pathComponents: [String]
    
    /// Query arguments for API, if any
    let queryParameters: [URLQueryItem]
    
    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    
    /// Computed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    /// Cosntruct request
    /// - Parameters :
    ///     - endpoint: Target endpoint
    ///     - pathComponents: Collection of Path components
    ///     - queryParameters: Collection of query parameters
    public init(
        endpoint: Endpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        
        self.queryParameters = queryParameters
    }
    
}

extension Request {
    static let listCharactersRequest = Request(endpoint: .character)
}
