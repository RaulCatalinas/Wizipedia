//
//  Api.swift
//  Wizipedia
//
//  Created by Tardes on 23/1/26.
//

import Foundation

class Api {
    static func getCharacters() async -> Characters {
        do {
            let (res, _) = try await URLSession.shared.data(
                from: URL(string: "\(API_BASE_URL)/charcters")!
            )

            return try JSONDecoder().decode(Characters.self, from: res)
        } catch {
            print("Error getting characters: \(error)")

            return []
        }
    }

    static func getCharcter(id: String) async -> Character? {
        do {
            let (res, _) = try await URLSession.shared.data(
                from: URL(string: "\(API_BASE_URL)/charcters/\(id)")!
            )

            return try JSONDecoder().decode(Character.self, from: res)
        } catch {
            print("Error getting character: \(error)")

            return nil
        }
    }

    static func getCharacters(house: House) async -> Characters {
        do {
            let (res, _) = try await URLSession.shared.data(
                from: URL(string: "\(API_BASE_URL)/characters/houses/\(house)")!
            )

            return try JSONDecoder().decode(Characters.self, from: res)
        } catch {
            print("Error getting characters: \(error)")

            return []
        }
    }

    static func getStaff() async -> Characters {
        do {
            let (res, _) = try await URLSession.shared.data(
                from: URL(string: "\(API_BASE_URL)/charcters")!
            )

            let characters = try JSONDecoder().decode(
                Characters.self,
                from: res
            )

            return characters.filter {
                character in character.hogwartsStaff
            }
        } catch {
            print("Error getting staff: \(error)")

            return []
        }
    }

    static func getSpells() async -> Spells {
        do {
            let (res, _) = try await URLSession.shared.data(
                from: URL(string: "\(API_BASE_URL)/spells")!
            )

            return try JSONDecoder().decode(Spells.self, from: res)
        } catch {
            print("Error getting spells: \(error)")

            return []
        }
    }
}
