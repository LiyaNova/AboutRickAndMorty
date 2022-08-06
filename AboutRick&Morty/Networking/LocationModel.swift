//
//  LocationModel.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 05.08.2022.
//

import Foundation

struct LocationModel: Decodable {
    let results: [Locations]
}

struct Locations: Decodable {
    let name: String
    let type: String
    let dimension: String
}

