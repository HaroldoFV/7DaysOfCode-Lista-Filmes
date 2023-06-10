//
//  ViewController.swift
//  7DaysOfCode-Lista-Filmes
//
//  Created by Haroldo Vinente on 08/06/23.
//

import UIKit

class HomeVC: UIViewController {
    private let service: MovieService = .init()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(MovieDetailTableViewCell.self, forCellReuseIdentifier: MovieDetailTableViewCell.identifier)
//        tableView.delegate = self
//        tableView.dataSource = self
        return tableView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.text = "Filmes Populares"
        return label
    }()

    var data: [Movie] = [
        //        Movie(id: 1, title: "Órfã 2: A Origem", releaseDate: "2022-07-27", image: nil, overview: "", voteAverage: 7.2),
//        Movie(id: 2, title: "Minions 2: A Origem de Gru", releaseDate: "2022-06-29", image: nil, overview: "", voteAverage: 7.8),
//        Movie(id: 3, title: "Thor: Amor e Trovão", releaseDate: "2022-07-06", image: nil, overview: "", voteAverage: 6.8),
//        Movie(id: 4, title: "Avatar", releaseDate: "2009-12-18", image: nil, overview: "", voteAverage: 8.8),
    ]

    func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }

    private func addSubView() {
        view.addSubview(self.titleLabel)
        view.addSubview(self.tableView)
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            self.tableView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 32.0),
            self.tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.configBackGround()
        self.addSubView()
        self.setUpConstraints()
        self.configTableViewProtocols(delegate: self, dataSource: self)
        self.service.fetchPopularMovies { [weak self] result in
            switch result {
                case .success(let model): DispatchQueue.main.async {
                        self?.updateUI(with: model)
                    }
                case .failure(let error):
                    print("Erro: \(error.localizedDescription)")
            }
        }
    }

    private func updateUI(with model: MovieResults) {
        self.data = model.results
        self.tableView.reloadData()
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: MovieDetailTableViewCell.identifier, for: indexPath) as? MovieDetailTableViewCell
        cell?.selectionStyle = .none
        cell?.setUpCell(data: self.data[indexPath.row])
        cell?.backgroundColor = .clear
        cell?.textLabel?.textColor = .white
        return cell ?? UITableViewCell()
    }
}
