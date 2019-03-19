//
//  ViewController.swift
//  StarWarsTestApp
//
//  Created by Loginov Arkadiy on 17.03.2019.
//  Copyright © 2019 Loginov Arkadiy. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let identifier = "cell"
    let personService: PersonService = PersonsServiceNetwork()
    var persons = [Person]()
    var selected: Int = 0
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self

        personService.getPeople { persons in
            self.persons = persons
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = persons[indexPath.row].name
        let height = "\(persons[indexPath.row].height)"
        cell.detailTextLabel?.text = String(height.prefix(3))
        cell.imageView?.image = UIImage(named: persons[indexPath.row].getFileName())
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = indexPath.row
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc: PersonViewController = segue.destination as! PersonViewController
        vc.person = persons[tableView.indexPathForSelectedRow!.row]
    }
}
