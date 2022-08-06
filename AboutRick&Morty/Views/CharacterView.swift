//
//  CharacterView.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 04.08.2022.
//

import UIKit

final class CharacterView: UIView {

    let netData = NetworkManager()

    var characters = [Characters]()


    private lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.delegate = self
        sb.placeholder = " Искать..."
        sb.sizeToFit()
        sb.barTintColor = UIColor(named: "Color")
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
        tableView.backgroundColor = UIColor(named: "Color")
        tableView.separatorColor = .gray
        tableView.separatorInset = .zero
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()



    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "Color")
       self.setView()
        self.netData.delegate = self
            self.netData.getCharacterInfo()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   private func setView() {
       [
        self.searchBar,
        self.characterTableView
       ].forEach { self.addSubview($0) }

       NSLayoutConstraint.activate([

        self.searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
        self.searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        self.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),


        self.characterTableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor),
        self.characterTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        self.characterTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        self.characterTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)

       ])



    }


}

//MARK: - UITableViewDataSource

extension CharacterView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        let character = characters[indexPath.row]
        cell.setCell(model: character)

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

//            if searchText.isEmpty {
             //   filteredCitiesList = citiesList
                characterTableView.reloadData()
//            } else {
//
//                func filterTableView(text:String) {
//                    let search = text.lowercased()
//                    filteredCitiesList = citiesList.filter({ (mod) -> Bool in
//                        return mod.name!.lowercased().contains(search)
//                    })
//                    self.tableView.reloadData()
//                }
//
//                filterTableView(text: searchText)
//            }
        }

}

//MARK: - NetworkDelegate

extension CharacterView: NetworkDelegate {
    func showData(data: [Characters]) {
        characters = data
        characterTableView.reloadData()
    }


}

