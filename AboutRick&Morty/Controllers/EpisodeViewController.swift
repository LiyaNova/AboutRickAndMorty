//
//  EpisodeViewController.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 04.08.2022.
//

import UIKit

final class EpisodeViewController: UIViewController {

    private let networkManager = NetworkManager()
    private lazy var episodeView = EpisodeView(episodes: self.episodes)

    private var episodes: [Episodes] = [] {
        didSet {
            self.episodeView.episodes = self.episodes
        }
    }
    
    override func loadView() {
        self.view = self.episodeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Эпизоды"
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor : UIColor.white ]

        self.networkManager.getEpisodeInfo()
        self.networkManager.addEpisode = { [weak self] episode in
            guard let self = self else { return }
            self.episodes = episode
        }
    }

}
