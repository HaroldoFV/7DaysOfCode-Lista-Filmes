//
//  MovieServices.swift
//  7DaysOfCode-Lista-Filmes
//
//  Created by Haroldo Vinente on 10/06/23.
//

import Foundation
import UIKit

class MovieService {
    private func getKey() -> String? {
        var keys: NSDictionary?
        guard let path = Bundle.main.path(forResource: "Secrets", ofType: "plist") else { return nil }
        keys = NSDictionary(contentsOfFile: path)
        return keys?["APIKey"] as? String
    }
  
    func fetchPopularMovies(completion: @escaping (Result<MovieResults, Error>) -> Void) {
        guard let key = getKey() else { return }
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(key)&language=pt-BR&page=1") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "Invalid Response", code: 0, userInfo: nil)))
                return
            }
            
            guard (200 ... 299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "Invalid Status Code", code: httpResponse.statusCode, userInfo: nil)))
                return
            }
            
            if let data = data {
                do {
                    let result: MovieResults = try JSONDecoder().decode(MovieResults.self, from: data)
                    completion(.success(result))
                    
                } catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}
