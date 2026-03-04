//
//  GetAllCharactersResponse.swift
//  ios-api-explorer-mvvm-swift
//
//  Created by otavio brito on 11/2/2026.
//

import Foundation

struct GetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [CharacterModel]
}
