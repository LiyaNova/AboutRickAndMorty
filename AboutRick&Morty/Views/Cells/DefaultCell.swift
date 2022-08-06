//
//  DefaultCell.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 04.08.2022.
//

import UIKit

final class DefaultCell: UITableViewCell {

    private lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Рик и Морти"
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .left
        lbl.textColor = .white
        lbl.font = .boldSystemFont(ofSize: 25)
        return lbl
    }()

    private lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Дедушка и внук \nЛюди \nЖивут на Земле"
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .left
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 15)
        return lbl
    }()

    private lazy var labelStackView: UIStackView = {
        let stv = UIStackView(arrangedSubviews:
                                [
                                    self.nameLabel,
                                    self.descriptionLabel
                                ])
        stv.translatesAutoresizingMaskIntoConstraints = false
        stv.axis = .vertical
        stv.distribution = .fillEqually
        return stv
    }()


    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor(named: "customColor")

        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setLocationCell(model: Locations) {
        self.nameLabel.text = model.name
        self.descriptionLabel.text = "Тип: \(model.type) \nИзмерение: \(model.dimension)"
    }

    func setEpisodeCell(model: Episodes) {
        self.nameLabel.text = model.name
        self.descriptionLabel.text = "Дата выпуска: \(model.airDate) \nСезон/эпизод: \(model.episode)"
    }

    private func setupView() {
        self.contentView.addSubview(self.labelStackView)

        NSLayoutConstraint.activate([
            self.labelStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.labelStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,
                                                                                          constant: 10),
            self.labelStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,
                                                                                         constant: -10),
            self.labelStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,
                                                                                         constant: -10),
        ])
    }

}
