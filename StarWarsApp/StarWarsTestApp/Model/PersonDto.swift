//
//  PersonDto.swift
//  StarWarsTestApp
//
//  Created by Loginov Arkadiy on 20.03.2019.
//  Copyright © 2019 Loginov Arkadiy. All rights reserved.
//

import RealmSwift
import Foundation

class PersonDto: Object{
    @objc dynamic var name = "";
    @objc dynamic var updateAt = Date()
}
