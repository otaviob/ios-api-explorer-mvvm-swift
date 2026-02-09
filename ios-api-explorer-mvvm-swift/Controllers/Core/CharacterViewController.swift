//
//  CharacterViewController.swift
//  ios-api-explorer-mvvm-swift
//
//  Created by otavio brito on 19/1/2026.
//

import UIKit


/// Controller to show and search for  Characters
final class CharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = Request(
            endpoint: .character,
            queryParameters: [
                URLQueryItem(name: "name", value: "Spider-Man"),
                URLQueryItem(name: "status", value: "alive")
            ]
        )
        print(request.url)
        
        Service.shared.execute(request,expecting: CharacterModel.self) { result in
            
        }
        
        
    }


}
