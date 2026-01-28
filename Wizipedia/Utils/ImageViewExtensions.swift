//
//  Image.swift
//  Wizipedia
//
//  Created by Tardes on 23/1/26.
//

import Foundation
import UIKit

extension UIImageView {
    func loadFromInternet(url: String) {
        self.image = UIImage.noImagePlaceholder
        guard let url = URL(string: url) else { return }

        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url),
                let image = UIImage(data: data)
            {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }

    func addBorderColor(
        _ color: UIColor,
        cornerRadius: CGFloat = 10.0,
        borderWidth: CGFloat = 2.0,
        useClipsToBounds: Bool = true
    ) {
        layer.borderColor = color.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        clipsToBounds = useClipsToBounds
    }
}
