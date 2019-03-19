//
//  PersonsServiceNetwork.swift
//  StarWarsTestApp
//
//  Created by Loginov Arkadiy on 17.03.2019.
//  Copyright © 2019 Loginov Arkadiy. All rights reserved.
//

import Foundation
import Alamofire

class PersonsServiceNetwork: PersonService {
    func getPersonByID(id: Int, _ completionHandler: @escaping ((Person) -> Void)) {
        request("https://swapi.co/api/people/\(id)").responseData {
            switch $0.result {
                case let .success(data):
                    let decoder = JSONDecoder()
                    let person = try?decoder.decode(Person.self, from: data)
                    completionHandler(person!)
                case let .failure(error):
                    print("Error: \(error)")
            }
        }
    }

    func getPeople(_ completionHandler: @escaping (([Person]) -> Void)) {
        request("https://swapi.co/api/people/").responseData {
            switch $0.result {
                case let .success(data):
                    let decoder = JSONDecoder()
                    let response  = try?decoder.decode(PeopleResponse.self, from: data)
                    let persons = response?.results
                    completionHandler(persons!)
                case let .failure(error):
                    print("Error: \(error)")
            }
        }
    }

}
