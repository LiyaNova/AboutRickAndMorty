//
//  LocationView.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 04.08.2022.
//

import UIKit

final class LocationView: UIView {

    var locations: [Locations] {
        didSet {
            self.locationTableView.reloadData()
        }
    }

    private var filteredLocations =  [Locations]()

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

    private lazy var locationTableView: UITableView = {
        let tableView = UITableView(frame: self.bounds, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DefaultCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.backgroundColor = UIColor(named: "customColor")
        tableView.separatorColor = .gray
        tableView.separatorInset = .zero
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()

    init(locations: [Locations], frame: CGRect = .zero) {
        self.locations = locations
        super.init(frame: frame)

        self.backgroundColor = UIColor(named: "customColor")
        self.setView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setView() {
        [   self.searchBar,
            self.locationTableView
        ].forEach { self.addSubview($0) }

        NSLayoutConstraint.activate([
            self.searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            self.locationTableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor),
            self.locationTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.locationTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.locationTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

//MARK: - UITableViewDataSource

extension LocationView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.isFirstResponder {
            return filteredLocations.count
        } else {
            return locations.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as!
        DefaultCell
        if searchBar.isFirstResponder {
            let location = filteredLocations[indexPath.row]
            cell.setLocationCell(model: location)
        } else {
            let location = locations[indexPath.row]
            cell.setLocationCell(model: location)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.height * 0.2
    }

}

//MARK: - UITableViewDelegate

extension LocationView: UITableViewDelegate {

}

//MARK: - UISearchBarDelegate

extension LocationView: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredLocations = locations
            locationTableView.reloadData()
        } else {
            filteredLocations = locations.filter({ (character) in
                return character.name.lowercased().contains(searchText.lowercased())
            })
        }
        locationTableView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }

}
