//
//  DBViewModel.swift
//  DragonBallApp
//
//  Created by Marco Guevara on 28/03/24.
//

import Foundation

class DBViewModel: ObservableObject {
    @Published var characters: [DBZCharacter] = []
    
    private let service = NetworkManager.shared
    private var page = 1
    
    init() {
        getListOfCharacters()
    }
    
    func getListOfCharacters() {
        service.getListOfCharacters(pageNumber: page) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let characters):
                    self?.characters = characters.items
                case .failure(let error):
                    debugPrint("Error: \(error)")
                }
            }
        }
    }
}
