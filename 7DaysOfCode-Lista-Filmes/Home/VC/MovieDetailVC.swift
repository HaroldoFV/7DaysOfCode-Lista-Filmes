//
//  MovieDetailVC.swift
//  7DaysOfCode-Lista-Filmes
//
//  Created by Haroldo Vinente on 13/06/23.
//

import UIKit

class MovieDetailVC: UIViewController {
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        print("movie detail: \(String(describing: movie))")
    }
}
