//
//  CharacterModel.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 05.08.2022.
//

import Foundation

struct CharacterModel: Codable {
    let results: [Characters]
}

struct Characters: Codable {
    let name: String
    let gender: String
    let species: String
    let image: String
    let location: Location
}

struct Location: Codable {
    let name: String
}
