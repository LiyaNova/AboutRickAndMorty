//
//  MenuView.swift
//  AboutRick&Morty
//
//  Created by Юлия Филимонова on 03.08.2022.
//

import UIKit

final class MainView: UIView {

    private lazy var nameImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "logo")
        return img
    }()

    private lazy var characterButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "hero"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.imageView?.layer.cornerRadius = 10
        btn.imageView?.layer.borderColor = UIColor.green.cgColor
        btn.imageView?.layer.borderWidth = 2
        //      bottomButton.addTarget(self, action: #selector(didTapBottomButton), for: .touchUpInside)
       return btn
   }()

    private lazy var locationButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "place"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.imageView?.layer.cornerRadius = 10
        btn.imageView?.layer.borderColor = UIColor.green.cgColor
        btn.imageView?.layer.borderWidth = 2
 //      bottomButton.addTarget(self, action: #selector(didTapBottomButton), for: .touchUpInside)
       return btn
   }()

    private lazy var episodeButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "episode"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.imageView?.layer.cornerRadius = 10
        btn.imageView?.layer.borderColor = UIColor.green.cgColor
        btn.imageView?.layer.borderWidth = 2
 //      bottomButton.addTarget(self, action: #selector(didTapBottomButton), for: .touchUpInside)
       return btn
   }()

    private lazy var buttonStackView: UIStackView = {
        let stv = UIStackView(arrangedSubviews:
                                [
                                    self.characterButton,
                                    self.locationButton,
                                    self.episodeButton
                                ])
        stv.translatesAutoresizingMaskIntoConstraints = false
        stv.axis = .vertical
        stv.spacing = 20.0
        stv.distribution = .fillEqually
        return stv
    }()

    private lazy var characterLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Персонажи"
        lbl.textAlignment = .left
        lbl.textColor = .white
        lbl.backgroundColor = UIColor(named: "Color")
        lbl.layer.masksToBounds = true
        lbl.layer.cornerRadius = 8
        lbl.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
        lbl.font = .boldSystemFont(ofSize: 20)
        return lbl
    }()

    private lazy var locationLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Локации"
        lbl.textAlignment = .left
        lbl.textColor = .white
        lbl.backgroundColor = UIColor(named: "Color")
        lbl.layer.masksToBounds = true
        lbl.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
        lbl.layer.cornerRadius = 8
        lbl.font = .boldSystemFont(ofSize: 20)
        return lbl
    }()

    private lazy var episodeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Эпизоды"
        lbl.textAlignment = .left
        lbl.textColor = .white
        lbl.backgroundColor = UIColor(named: "Color")
        lbl.layer.masksToBounds = true
        lbl.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
        lbl.layer.cornerRadius = 8
        lbl.font = .boldSystemFont(ofSize: 20)
        return lbl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "Color")
        self.setViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setViews() {
        [
         self.nameImage,
         self.buttonStackView,
         self.characterLabel,
         self.locationLabel,
         self.episodeLabel
        ].forEach { self.addSubview($0) }

        NSLayoutConstraint.activate([

            self.nameImage.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            self.nameImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.nameImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.nameImage.heightAnchor.constraint(equalToConstant: 110),

            self.buttonStackView.topAnchor.constraint(equalTo: self.nameImage.bottomAnchor,constant: 10),
            self.buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.buttonStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,                                                                                constant: -20),
            self.characterLabel.bottomAnchor.constraint(equalTo: self.characterButton.bottomAnchor, constant: -2),
            self.characterLabel.trailingAnchor.constraint(equalTo: self.characterButton.trailingAnchor, constant: -2),

            self.locationLabel.bottomAnchor.constraint(equalTo: self.locationButton.bottomAnchor, constant: -2),
            self.locationLabel.trailingAnchor.constraint(equalTo: self.locationButton.trailingAnchor, constant: -2),

            self.episodeLabel.bottomAnchor.constraint(equalTo: self.episodeButton.bottomAnchor, constant: -2),
            self.episodeLabel.trailingAnchor.constraint(equalTo: self.episodeButton.trailingAnchor, constant: -2),

        ])

    }

}
