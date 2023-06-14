//
//  MovieDetailVC.swift
//  7DaysOfCode-Lista-Filmes
//
//  Created by Haroldo Vinente on 13/06/23.
//

import Kingfisher
import UIKit

class MovieDetailVC: UIViewController {
    var movie: Movie

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.title
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        return label
    }()

    private lazy var movieImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 32.0
        imgView.layer.masksToBounds = true
        return imgView
    }()

    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Classificação dos usuários: \(movie.voteAverage)"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white.withAlphaComponent(0.75)
        label.attributedText = NSAttributedString(string: movie.overview) // .withLineSpacing(8.0)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .red
//        print("movie detail: \(String(describing: movie))")
        view.configBackGround()
        navigationController?.navigationBar.tintColor = UIColor.white
    }

    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
        guard let urlImage = movie.image else { return }
        addSubView()
        configConstraints()
        configImage(image: urlImage)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configImage(image: String?) {
        guard let imageURL = image else { return }
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(imageURL)")
        movieImageView.kf.setImage(with: url)
    }

    func addSubView() {
        view.addSubview(titleLabel)
        view.addSubview(movieImageView)
        view.addSubview(scoreLabel)
        view.addSubview(descriptionLabel)
    }

    func configConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32.0),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),

            scoreLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 32.0),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            movieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImageView.widthAnchor.constraint(equalToConstant: 192.0),
            movieImageView.heightAnchor.constraint(equalToConstant: 264.0),
            movieImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32.0),

            descriptionLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 32.0),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),

        ])
    }
}
