//
//  UIViewExtensions.swift
//  Wizipedia
//
//  Created by Tardes on 30/1/26.
//

import UIKit

extension UIView {
    func roundCorners(radious: CGFloat) {
        layer.cornerRadius = radious
        clipsToBounds = true
    }

    func applyCardStyle(
        cornerRadius: CGFloat = 12,
        shadowColor: UIColor = .black,
        shadowOpacity: Float = 0.1,
        shadowOffset: CGSize = CGSize(width: 0, height: 4),
        shadowRadius: CGFloat = 6
    ) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false

        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
    }
}
