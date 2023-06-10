//
//  UIView+Extension.swift
//  7DaysOfCode-Lista-Filmes
//
//  Created by Haroldo Vinente on 09/06/23.
//

import Foundation
import UIKit

extension UIView {
    func configBackGround() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.lightBackground.cgColor, UIColor.darkBackground.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        self.layer.addSublayer(gradient)
    }
}
