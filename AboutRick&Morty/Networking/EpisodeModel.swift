//
//  EpisodeModel.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 05.08.2022.
//

import Foundation

struct EpisodeModel: Decodable {
    let results: [Episodes]
}

struct Episodes: Decodable {
    let name: String
    let airDate: String
    let episode: String

    private enum CodingKeys : String, CodingKey {
        case name
        case airDate = "air_date"
        case episode
    }
}


