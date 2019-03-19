//
//  PersonService.swift
//  StarWarsTestApp
//
//  Created by Loginov Arkadiy on 17.03.2019.
//  Copyright © 2019 Loginov Arkadiy. All rights reserved.
//

protocol PersonService {
    func getPeople(_ completionHandler: @escaping(([Person]) -> Void))
    func getPersonByID(id: Int, _ completionHandler: @escaping ((Person) -> Void))
}
