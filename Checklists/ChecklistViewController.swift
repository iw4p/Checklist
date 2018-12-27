//
//  ViewController.swift
//  Checklists
//
//  Created by Nima Akbarzade on 10/6/1397 AP.
//  Copyright © 1397 AP Nima Akbarzade. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    let row0text = "Walk the dog"
    let row1text = "Brush teeth"
    let row2text = "Learn iOS development"
    let row3text = "Soccer practice"
    let row4text = "Eat ice cream"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row % 5 == 0 {
            label.text = "Walk the dog"
        } else if indexPath.row % 5 == 1 {
            label.text = "Brush my teeth"
        } else if indexPath.row % 5 == 2 {
            label.text = "Learn iOS development"
        } else if indexPath.row % 5 == 3 {
            label.text = "Soccer practice"
        } else if indexPath.row % 5 == 4 {
            label.text = "Eat ice cream"
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

