//
//  LocationModel.swift
//  ios-api-explorer-mvvm-swift
//
//  Created by otavio brito on 19/1/2026.
//

import Foundation

struct LocationModel: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
