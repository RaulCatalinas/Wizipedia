//
//  StringExtensions.swift
//  Wizipedia
//
//  Created by Tardes on 30/1/26.
//

extension String {
    func capitalizingFirstLetter() -> String {
        if self.isEmpty { return "Unknown" }

        guard let first = self.first else { return self }

        return first.uppercased() + self.dropFirst()
    }
}
