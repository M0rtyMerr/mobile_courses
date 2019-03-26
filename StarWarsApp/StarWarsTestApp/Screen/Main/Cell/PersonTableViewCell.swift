//
//  PersonTableViewCell.swift
//  StarWarsTestApp
//
//  Created by Loginov Arkadiy on 25.03.2019.
//  Copyright © 2019 Loginov Arkadiy. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    

    
    @IBOutlet private var imagePerson: UIImageView!
    
    @IBOutlet private var name: UILabel!
    
    var person : Person?{
        didSet{
            name.text = person?.name
            //myImageView.image = UIImage(named: person!.getFileName())
        }
    }
}
