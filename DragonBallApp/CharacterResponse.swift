//
//  CharacterResponse.swift
//  DragonBallApp
//
//  Created by Marco Guevara on 28/03/24.
//

import Foundation

struct CharacterResponse: Codable {
    let items: [DBZCharacter]
    let meta: Meta
}

struct DBZCharacter: Codable, Identifiable {
    let id: Int
    let name, ki, maxKi, race: String
    let gender: Gender
    let description: String
    let image: String
    let affiliation: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
}

struct Meta: Codable {
    let totalItems, itemCount, itemsPerPage, totalPages: Int
    let currentPage: Int 
}
