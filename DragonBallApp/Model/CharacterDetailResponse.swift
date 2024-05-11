//
//  CharacterDetailResponse.swift
//  DragonBallApp
//
//  Created by Marco Guevara on 1/05/24.
//

import Foundation

struct CharacterDetailResponse: Codable {
    let id: Int
    let name, ki, maxKi, race: String
    let gender, description: String
    let image: String
    let affiliation: String
    let originPlanet: OriginPlanet
    let transformations: [Transformation]
}

struct OriginPlanet: Codable {
    let id: Int
    let name: String
    let isDestroyed: Bool
    let description: String
    let image: String
}

struct Transformation: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let ki: String
}
