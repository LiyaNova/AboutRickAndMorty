//
//  CharacterViewController.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 04.08.2022.
//

import UIKit

final class CharacterViewController: UIViewController {

    private let networkManager = NetworkManager()
    private lazy var characterView = CharacterView(characters: self.characters)

    private var characters: [Characters] = [] {
        didSet {
            self.characterView.characters = self.characters
        }
    }

    override func loadView() {
        self.view = self.characterView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Персонажи"
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor : UIColor.white ]

        self.networkManager.getCharacterInfo()
        self.networkManager.addCharacter = { [weak self] character in
            guard let self = self else { return }
            self.characters = character
        }
    }

}
