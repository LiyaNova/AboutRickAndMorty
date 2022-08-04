//
//  CharacterViewController.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 04.08.2022.
//

import UIKit

class CharacterViewController: UIViewController {

    let characterView = CharacterView()

    override func loadView() {
        self.view = self.characterView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Персонажи"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor : UIColor.white ]
    }

}
