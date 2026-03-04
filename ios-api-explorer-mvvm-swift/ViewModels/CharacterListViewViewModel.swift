//
//  CharacterListViewViewModel.swift
//  ios-api-explorer-mvvm-swift
//
//  Created by otavio brito on 14/2/2026.
//

import Foundation

struct CharacterListViewViewModel {
    func fetchCharacters() {
        Service.shared.execute(.listCharactersRequest, expecting: GetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: "+String(model.info.count))
                print("Page result count: "+String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
        
    }
}
