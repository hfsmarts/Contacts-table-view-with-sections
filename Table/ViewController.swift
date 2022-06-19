//
//  ViewController.swift
//  Table
//
//  Created by Harun Fazlic on 16. 6. 2022..
//

import UIKit

struct Contact{
    var name: String
    var surname: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            let nib = UINib.init(nibName: String(describing: ContactTableViewCell.self), bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: String(describing: ContactTableViewCell.self))
        }
    }
    
    var model: [String : [Contact]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model["A"] = [
            .init(name: "Aaaa", surname: "Aaaa"),
            .init(name: "Abbb", surname: "Abbb")
        ]

        model["B"] = [
            .init(name: "Baaaa", surname: "Baaaa"),
            .init(name: "Bcccc", surname: "Bcccc"),
            .init(name: "Bdddd", surname: "Bdddd")
        ]

        model["M"] = [
            .init(name: "Maaaa", surname: "Maaaa"),
            .init(name: "Mbbbb", surname: "Mbbbb"),
            .init(name: "Mcccc", surname: "Mcccc"),
            .init(name: "Mdddd", surname: "Mdddd")
        ]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        model.keys.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Array(model.keys.sorted())[section]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let s = Array(model.keys.sorted())[section]
        return model[s]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sec = Array(model.keys.sorted())[indexPath.section]
        let singleModel =  model[sec]?[indexPath.row]
        let cell =  tableView.dequeueReusableCell(withIdentifier: String(describing: ContactTableViewCell.self), for: indexPath) as! ContactTableViewCell
        cell.nameLabel.text = singleModel?.name
        cell.surnameLabel.text = singleModel?.surname
        return cell
    }
}

