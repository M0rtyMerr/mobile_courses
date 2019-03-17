//
//  PeopleResponse.swift
//  StarWarsTestApp
//
//  Created by Loginov Arkadiy on 17.03.2019.
//  Copyright © 2019 Loginov Arkadiy. All rights reserved.
//

struct PeopleResponse: Decodable {
    let count : Int
    let result : [Person]
    enum CodingCase: String, CodingKey{
        case count
        case result
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingCase.self)
        count = try values.decode(Int.self, forKey: .count)
        result = try values.decode([Person].self, forKey: .result)
    }
}
