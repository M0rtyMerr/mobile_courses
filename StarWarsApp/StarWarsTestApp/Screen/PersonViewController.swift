//
//  PersonViewController.swift
//  StarWarsTestApp
//
//  Created by Loginov Arkadiy on 18.03.2019.
//  Copyright © 2019 Loginov Arkadiy. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {
    var person: Person?
    let identifier = "cellFilm"
    
    @IBOutlet weak var imagePerson: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var eyeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = person!.name
        birthLabel.text = person!.birthYear
        heightLabel.text = person!.height
        massLabel.text = person!.mass
        eyeLabel.text = person!.eyeColor
        imagePerson.image = UIImage(named: person!.getFileName())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person!.films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = person!.films[indexPath.row]
        return cell
    }
    
}
