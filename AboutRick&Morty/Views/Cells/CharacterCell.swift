//
//  CharacterCell.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 04.08.2022.
//

import UIKit

class CharacterCell: UITableViewCell {


    private lazy var nameImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "hero")
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 10
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.green.cgColor
        return img
    }()

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
        lbl.font = .systemFont(ofSize: 13)
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
        stv.spacing = 5.0
        stv.distribution = .fillEqually
        return stv
    }()

    private lazy var viewStackView: UIStackView = {
        let stv = UIStackView(arrangedSubviews:
                                [
                                    self.nameImage,
                                    self.labelStackView
                                ])
        stv.translatesAutoresizingMaskIntoConstraints = false
        stv.axis = .horizontal
        stv.spacing = 20.0
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
        contentView.addSubview(self.viewStackView)
        
        NSLayoutConstraint.activate([

            self.viewStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            self.viewStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            self.viewStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            self.viewStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)

        ])

        
    }
}
