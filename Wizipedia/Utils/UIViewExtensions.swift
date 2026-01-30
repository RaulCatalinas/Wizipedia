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
}
