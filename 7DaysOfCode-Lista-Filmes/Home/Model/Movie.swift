//
//  Movie.swift
//  7DaysOfCode-Lista-Filmes
//
//  Created by Haroldo Vinente on 08/06/23.
//

import UIKit

struct Movie: Codable {
    var id: Int
    var title: String
    var releaseDate: String
    var image: String?
    var overview: String
    var voteAverage: Double

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case image = "poster_path"
        case overview
        case voteAverage = "vote_average"
    }
}

struct MovieResults: Codable {
    let results: [Movie]
}
