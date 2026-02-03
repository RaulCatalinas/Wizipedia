//
//  LabelUtils.swift
//  Wizipedia
//
//  Created by Tardes on 3/2/26.
//
import ExpandableLabel
import Foundation
import UIKit

extension ExpandableLabel {
    func contigureViewMoreViewLess(
        numberOfLines: Int = 5,
        linkAttributes: [NSAttributedString.Key: UIColor] = [
            NSAttributedString.Key.foregroundColor: UIColor.blue
        ]
    ) {
        self.numberOfLines = numberOfLines
        self.shouldCollapse = true

        self.collapsedAttributedLink = NSAttributedString(
            string: "See More",
            attributes: linkAttributes
        )
        self.expandedAttributedLink = NSAttributedString(
            string: "See Less",
            attributes: linkAttributes
        )
    }
}
