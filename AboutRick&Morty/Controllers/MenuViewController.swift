//
//  MenuViewController.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 03.08.2022.
//

import UIKit

final class MenuViewController: UIViewController {

    private let menuView = MainView()

    override func loadView() {
        self.view = self.menuView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuView.delegate = self
    }
    
}

//MARK: - TapButtonDelegate

extension MenuViewController: TapButtonDelegate {
    
    func seeCharacters() {
        let chVC = CharacterViewController()
        navigationController?.pushViewController(chVC, animated: true)
    }

    func seeLocations() {
        let lVC = LocationViewController()
        navigationController?.pushViewController(lVC, animated: true)
    }

    func seeEpisodes() {
        let eVC = EpisodeViewController()
        navigationController?.pushViewController(eVC, animated: true)
    }

}
