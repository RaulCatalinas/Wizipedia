//
//  RoundedImageView.swift
//  Wizipedia
//
//  Created by Tardes on 28/1/26.
//

import UIKit

class RoundedImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
        clipsToBounds = true
    }
}
