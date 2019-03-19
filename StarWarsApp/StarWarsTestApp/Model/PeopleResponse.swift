//
//  PeopleResponse.swift
//  StarWarsTestApp
//
//  Created by Loginov Arkadiy on 17.03.2019.
//  Copyright © 2019 Loginov Arkadiy. All rights reserved.
//

struct PeopleResponse: Codable {
    let count: Int
    let results: [Person]
    enum CodingCase: String, CodingKey {
        case count
        case results
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingCase.self)
        count = try values.decode(Int.self, forKey: .count)
        results = try values.decode([Person].self, forKey: .results)
    }
}
