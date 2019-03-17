//
//  Person.swift
//  StarWarsTestApp
//
//  Created by Loginov Arkadiy on 17.03.2019.
//  Copyright © 2019 Loginov Arkadiy. All rights reserved.
//

struct Person: Decodable {
    let name : String
    let height : Int
    let birthYear : String
    
    private enum CodingKeys: String, CodingKey{
        case name
        case height
        case birthYear = "birth_year"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        height = try values.decode(Int.self, forKey: .height)
        birthYear = try values.decode(String.self, forKey: .birthYear)
    }
}
