//
//  CharacterView.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 04.08.2022.
//

import UIKit

final class CharacterView: UIView {

    var characters: [Characters] {
        didSet {
            self.characterTableView.reloadData()
        }
    }

    private var filteredCharacters =  [Characters]()

    private lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.delegate = self
        sb.placeholder = " Искать..."
        sb.sizeToFit()
        sb.barTintColor = UIColor(named: "customColor")
        sb.tintColor = .white
        sb.searchTextField.backgroundColor = .white
        return sb

    }()

    private lazy var characterTableView: UITableView = {
        let tableView = UITableView(frame: self.bounds, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CharacterCell.self, forCellReuseIdentifier: "CharacterCell")
        tableView.backgroundColor = UIColor(named: "customColor")
        tableView.separatorColor = .gray
        tableView.separatorInset = .zero
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()

    init(characters: [Characters], frame: CGRect = .zero) {
        self.characters = characters
        super.init(frame: frame)

        self.backgroundColor = UIColor(named: "customColor")
        self.setView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setView() {
        [   self.searchBar,
            self.characterTableView
        ].forEach { self.addSubview($0) }

        NSLayoutConstraint.activate([
            self.searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            self.characterTableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor),
            self.characterTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.characterTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.characterTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

//MARK: - UITableViewDataSource

extension CharacterView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.isFirstResponder {
            return filteredCharacters.count
        } else {
            return characters.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as!                                                                                    CharacterCell
        if searchBar.isFirstResponder {
            let character = filteredCharacters[indexPath.row]
            cell.setCell(model: character)
        } else {
            let character = characters[indexPath.row]
            cell.setCell(model: character)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.height * 0.2
    }

}

//MARK: - UITableViewDelegate

extension CharacterView: UITableViewDelegate {
    
}

//MARK: - UISearchBarDelegate

extension CharacterView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredCharacters = characters
            characterTableView.reloadData()
        } else {
            filteredCharacters = characters.filter({ (character) in
                return character.name.lowercased().contains(searchText.lowercased())
            })
        }
        characterTableView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }

}


