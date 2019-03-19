//
//  Person.swift
//  StarWarsTestApp
//
//  Created by Loginov Arkadiy on 17.03.2019.
//  Copyright © 2019 Loginov Arkadiy. All rights reserved.
//

struct Person: Codable {
    let name, height, mass, hairColor: String
    let skinColor, eyeColor, birthYear: String
    let homeworld: String
    let films, species, vehicles, starships: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, height, mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case homeworld, films, species, vehicles, starships, created, edited, url
    }

    func getFileName() -> String {
        var filename = name.lowercased()
        let unwantedChars: Set = ["-", " ", ",", ".", "!", "?" ]
        for s in unwantedChars {
            filename = filename.replacingOccurrences(of: s, with: "")
        }
        return filename
    }
}
