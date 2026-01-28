//
//  Houses.swift
//  Wizipedia
//
//  Created by Tardes on 28/1/26.
//

import UIKit

enum HouseEnum: String {
    case gryffindor
    case hufflepuff
    case ravenclaw
    case slytherin
    case unknown

    var displayName: String {
        switch self {
        case .gryffindor: return "Gryffindor"
        case .hufflepuff: return "Hufflepuff"
        case .ravenclaw: return "Ravenclaw"
        case .slytherin: return "Slytherin"
        case .unknown: return "—"
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .gryffindor: return UIColor(hex: "#AE0001")
        case .hufflepuff: return UIColor(hex: "#ECB939")
        case .ravenclaw: return UIColor(hex: "#0E1A40")
        case .slytherin: return UIColor(hex: "#1A472A")
        case .unknown: return UIColor(hex: "#424242")
        }
    }

    var foregroundColor: UIColor {
        switch self {
        case .gryffindor: return UIColor(hex: "#FFD700")
        case .hufflepuff: return UIColor(hex: "#000000")
        case .ravenclaw: return UIColor(hex: "#FFFFFF")
        case .slytherin: return UIColor(hex: "#FFFFFF")
        case .unknown: return UIColor(hex: "#BDBDBD")
        }
    }

    static func fromString(_ house: String?) -> HouseEnum {
        guard let house = house?.lowercased() else { return .unknown }
        return HouseEnum(rawValue: house) ?? .unknown
    }
}
