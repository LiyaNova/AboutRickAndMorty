//
//  LocationViewController.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 04.08.2022.
//

import UIKit

final class LocationViewController: UIViewController {

    private let networkManager = NetworkManager()
    private lazy var locationView = LocationView(locations: self.locations)

    private var locations: [Locations] = [] {
        didSet {
            self.locationView.locations = self.locations
        }
    }

    override func loadView() {
        self.view = self.locationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Локации"
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor : UIColor.white ]

        self.networkManager.getLocationInfo()
        self.networkManager.addLocation = { [weak self] data in
            guard let self = self else { return }
            self.locations = data
        }
    }

}
