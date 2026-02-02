//
//  TabelViewExtension.swift
//  Wizipedia
//
//  Created by Tardes on 2/2/26.
//

import UIKit

extension UITableView {
    func scrollToTop(animated: Bool = true) {
        self.scrollToRow(
            at: IndexPath(row: 0, section: 0),
            at: .top,
            animated: animated
        )
    }
}
