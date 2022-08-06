//
//  NetworkManager.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 05.08.2022.
//

import UIKit
import Alamofire

final class NetworkManager {

    private let urlCharacter = "https://rickandmortyapi.com/api/character"
    private let urlLocation = "https://rickandmortyapi.com/api/location"
    private let urlEpisode = "https://rickandmortyapi.com/api/episode"

    var addCharacter: (([Characters]) -> ())?
    var addLocation: (([Locations]) -> ())?
    var addEpisode: (([Episodes]) -> ())?

    func getCharacterInfo() {
        AF.request(urlCharacter).responseDecodable(of: CharacterModel.self) { response in
            switch response.result {
            case .success(let data):
                self.addCharacter?(data.results)
            case .failure(let error):
                print(error)
            }
        }
    }

    func getLocationInfo() {
        AF.request(urlLocation).responseDecodable(of: LocationModel.self) { response in
            switch response.result {
            case .success(let data):
                self.addLocation?(data.results)
            case .failure(let error):
                print(error)
            }
        }
    }

    func getEpisodeInfo() {
        AF.request(urlEpisode).responseDecodable(of: EpisodeModel.self) { response in
            switch response.result {
            case .success(let data):
                self.addEpisode?(data.results)
            case .failure(let error):
                print(error)
            }
        }
    }

}

