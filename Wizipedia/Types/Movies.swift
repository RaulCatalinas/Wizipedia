// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movies = try? JSONDecoder().decode(Movies.self, from: jsonData)

import Foundation

// MARK: - Movie
struct Movie: Codable {
    let serial, title, summary: String
    let directors, screenwriters, producers, cinematographers: [String]
    let editors, distributors, musicComposers: [String]
    let releaseDate, runningTime, budget, boxOffice: String
    let rating: String
    let trailer: String
    let poster: String
    let wiki: String

    enum CodingKeys: String, CodingKey {
        case serial, title, summary, directors, screenwriters, producers, cinematographers, editors, distributors
        case musicComposers = "music_composers"
        case releaseDate = "release_date"
        case runningTime = "running_time"
        case budget
        case boxOffice = "box_office"
        case rating, trailer, poster, wiki
    }
}

typealias Movies = [Movie]
