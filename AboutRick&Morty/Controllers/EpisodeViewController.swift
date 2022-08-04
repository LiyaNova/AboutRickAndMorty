//
//  EpisodeViewController.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 04.08.2022.
//

import UIKit

class EpisodeViewController: UIViewController {

    let episodeView = LocationView()

    override func loadView() {
        self.view = self.episodeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Эпизоды"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor : UIColor.white ]
    }



}
