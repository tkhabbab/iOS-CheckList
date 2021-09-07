//
//  ViewController.swift
//  CheckList ios
//
//  Created by khabbab hossain on 8/9/21.
//

import UIKit
class ChecklistItem {
    let title: String
    var isChecked: Bool = false
    init(title: String) {
        self.title = title
    }
}

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{
   

    let items: [ChecklistItem] = [
        "Item One",
        "Item Two",
        "iOS Check list",
        "Check me","Item One",
        "Item Two",
        "iOS Check list",
        "Check me","Item One",
        "Item Two",
        "iOS Check list",
        "Check me"
    ].compactMap({ChecklistItem(title: $0)})
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        title = "CheckList "
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.isChecked ? .checkmark : .none
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        item.isChecked = !item.isChecked
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    

}

