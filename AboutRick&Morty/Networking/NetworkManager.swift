//
//  NetworkManager.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 05.08.2022.
//

import UIKit
import Alamofire

protocol NetworkDelegate: AnyObject {
    func showData(data: [Characters])
}

class NetworkManager {

//    var array = [Characters]()

    weak var delegate: NetworkDelegate?

    let urlCharacter = "https://rickandmortyapi.com/api/character"
    let urlLocation = "https://rickandmortyapi.com/api/location"
    let urlEpisode = "https://rickandmortyapi.com/api/episode"

    func getCharacterInfo() {
        AF.request(urlCharacter).responseDecodable(of: CharacterModel.self) { response in
            switch response.result {
            case .success(let data):
                    self.delegate?.showData(data: data.results)
//                self.array = data.results
            case .failure(let error):
                print(error)
            }
        }
    }

    func getLocationInfo() {
        AF.request(urlLocation).responseDecodable(of: CharacterModel.self) { response in
            switch response.result {
            case .success(let data):
                    self.delegate?.showData(data: data.results)
            case .failure(let error):
                print(error)
            }
        }
    }

    func getEpisodeInfo() {
        AF.request(urlLocation).responseDecodable(of: CharacterModel.self) { response in
            switch response.result {
            case .success(let data):
                    self.delegate?.showData(data: data.results)
            case .failure(let error):
                print(error)
            }
        }
    }


}

