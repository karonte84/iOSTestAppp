//
//  PersonListViewController.swift
//  ProvaApp
//
//  Created by michael.sanelli on 03/02/22.
//

import UIKit

class PersonListViewController: UIViewController {
    @IBOutlet weak var personListTableView: UITableView!
    
    private let data : [Dictionary] = [Dictionary(character: "a", person: [Person(firstName: "Alessio"), Person(firstName: "Alberto"), Person(firstName: "Alessandra")]),
                                       Dictionary(character: "b", person: [Person(firstName: "Benedetta"), Person(firstName: "Bruce")]),
                                       Dictionary(character: "c", person: [Person(firstName: "Carlo"), Person(firstName: "Caterina")])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.personListTableView.delegate = self
        self.personListTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PersonListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].person.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonListTableViewCell") as? PersonListTableViewCell
        cell?.setData(name: data[indexPath.section].person[indexPath.item].firstName)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = data[section].character
        return label
    }
}

struct Person {
    let firstName : String
}

struct Dictionary {
    let character : String
    let person : [Person]
}
