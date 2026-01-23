//
//  Spells.swift
//  Wizipedia
//
//  Created by Tardes on 23/1/26.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let spells = try? JSONDecoder().decode(Spells.self, from: jsonData)

import Foundation

// MARK: - Spell
struct Spell: Codable {
    let id, name, description: String
}

typealias Spells = [Spell]

