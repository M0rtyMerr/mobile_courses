//
//  MyPersonTableViewCell.swift
//  StarWarsTestApp
//
//  Created by Loginov Arkadiy on 26.03.2019.
//  Copyright © 2019 Loginov Arkadiy. All rights reserved.
//

import UIKit

class MyPersonTableViewCell: UITableViewCell {

    @IBOutlet private var imagePersonView: UIImageView!
    @IBOutlet private var namePersonView: UILabel!
    
    var person : Person?{
        didSet{
            namePersonView.text = person?.name
            imagePersonView.image = UIImage(named: person!.getFileName())
        }
    }
    
}
