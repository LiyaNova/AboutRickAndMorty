//
//  MenuViewController.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 03.08.2022.
//

import UIKit

class MenuViewController: UIViewController {

    let menuView = MainView()

    override func loadView() {
        self.view = self.menuView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

