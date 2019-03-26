//
//  MyPersonTableViewCell.swift
//  StarWarsTestApp
//
//  Created by Loginov Arkadiy on 26.03.2019.
//  Copyright © 2019 Loginov Arkadiy. All rights reserved.
//

import UIKit

class MyPersonTableViewCell: UITableViewCell {

    @IBOutlet weak var imagePersonView: UIImageView!
    @IBOutlet weak var namePersonView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    var person : Person?{
        didSet{
            namePersonView.text = person?.name
            imagePersonView.image = UIImage(named: person!.getFileName())
        }
    }
    
}
