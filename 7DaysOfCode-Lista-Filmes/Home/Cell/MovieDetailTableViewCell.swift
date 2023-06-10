//
//  MovieDetailTableViewCell.swift
//  7DaysOfCode-Lista-Filmes
//
//  Created by Haroldo Vinente on 08/06/23.
//

import Kingfisher
import UIKit

class MovieDetailTableViewCell: UITableViewCell {
    static let identifier: String = .init(describing: MovieDetailTableViewCell.self)

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()

    lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textAlignment = .center
        return label
    }()

    lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        return imageView
    }()

    private lazy var textsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        [titleLabel, releaseDateLabel].forEach { view in
            stack.addArrangedSubview(view)
        }
        stack.distribution = .fillProportionally
        stack.spacing = 8
        return stack
    }()

    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        [movieImageView, textsStackView].forEach { view in
            stack.addArrangedSubview(view)
        }
        stack.distribution = .fillProportionally
        stack.spacing = 16.0
        stack.alignment = .center
//        stack.backgroundColor = .blue
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        self.addSubView()
        self.setUpConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubView() {
        addSubview(self.titleLabel)
        addSubview(self.releaseDateLabel)
        addSubview(self.movieImageView)
        addSubview(self.textsStackView)
        addSubview(self.mainStackView)
    }

    public func setUpCell(data: Movie) {
        self.titleLabel.text = data.title
        self.releaseDateLabel.text = "Lançamento: \(data.releaseDate.formatDate())"
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
            self.mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0),
            self.mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24.0),
            self.mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24.0),

            self.movieImageView.widthAnchor.constraint(equalToConstant: 90),
            self.movieImageView.heightAnchor.constraint(equalToConstant: 120),

        ])
    }
}
