//
//  EpisodeModel.swift
//  ios-api-explorer-mvvm-swift
//
//  Created by otavio brito on 19/1/2026.
//

import Foundation

struct EpisodeModel: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}


