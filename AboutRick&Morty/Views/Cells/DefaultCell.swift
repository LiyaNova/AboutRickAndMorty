//
//  DefaultCell.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 04.08.2022.
//

import UIKit

class DefaultCell: UITableViewCell {



    private lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Рик и Морти"
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
        contentView.backgroundColor = UIColor(named: "Color")
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        contentView.addSubview(self.labelStackView)

        NSLayoutConstraint.activate([

            self.labelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            self.labelStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            self.labelStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                                                           constant: -10),
            self.labelStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

        ])


    }
}
