//
//  String+Extension.swift
//  7DaysOfCode-Lista-Filmes
//
//  Created by Haroldo Vinente on 09/06/23.
//

import Foundation

extension String {
    func formatDate() -> Self {
        let input = DateFormatter()
        input.dateFormat = "yyyy-MM-dd"
        let showDate = input.date(from: self)
        guard let showDate = showDate else {
            return "Erro ao obter data."
        }
        input.dateFormat = "dd/MM/yy"
        return input.string(from: showDate)
    }
}
