//
//  PersonDBService.swift
//  StarWarsTestApp
//
//  Created by Loginov Arkadiy on 20.03.2019.
//  Copyright © 2019 Loginov Arkadiy. All rights reserved.
//

import RealmSwift

class PersonDBService{
    private var realm : Realm{
        guard let realm = try? Realm() else {
            fatalError("Realm can`t be initialized")
        }
        return realm
    }
    
    func getAll() -> Results<PersonDto> {
        let persons = realm.objects(PersonDto.self)
        return persons
    }

    func add(person : Person){
        let personDto = PersonDto()
        personDto.name = person.name
        do{
            try realm.write {
                realm.add(personDto)
            }
        } catch{
            print(error)
        }
    }
    
}
