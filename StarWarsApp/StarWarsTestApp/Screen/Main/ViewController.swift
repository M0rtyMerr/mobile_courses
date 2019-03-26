//
//  ViewController.swift
//  StarWarsTestApp
//
//  Created by Loginov Arkadiy on 17.03.2019.
//  Copyright © 2019 Loginov Arkadiy. All rights reserved.
//

import UIKit
import RealmSwift
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var notificationToken: NotificationToken?
    
    private let dbService = PersonDBService()
    
    private lazy var personDtos = dbService.getAll()
    
    let identifier = "cell"
    let personService: PersonService = PersonsServiceNetwork()
    var persons = [Person]()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyPersonTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
        
        tableView.tableFooterView = UIView()
        
    
        notificationToken = personDtos.observe{ [weak self] _ in
            self?.tableView.reloadData()
        }
        
        personService.getPeople { persons in
            self.persons = persons
            for p in persons {
                self.dbService.add(person: p)
                print(p.name)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    deinit {
        notificationToken?.invalidate()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? MyPersonTableViewCell else {
            fatalError("TableView is incorrect")
        }
        let person = persons[indexPath.row]
        cell.person = person
        /*cell.textLabel?.text = persons[indexPath.row].name
        let height = "\(persons[indexPath.row].height)"
        cell.detailTextLabel?.text = String(height.prefix(3))
        cell.imageView?.image = UIImage(named: persons[indexPath.row].getFileName())*/
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc: PersonViewController = segue.destination as! PersonViewController
        vc.person = persons[tableView.indexPathForSelectedRow!.row]
    }
}

