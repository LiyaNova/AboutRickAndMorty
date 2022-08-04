//
//  LocationViewController.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 04.08.2022.
//

import UIKit

class LocationViewController: UIViewController {

    let locationView = LocationView()

    override func loadView() {
        self.view = self.locationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Локации"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor : UIColor.white ]
    }

    

}
