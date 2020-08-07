//
//  ViewController.swift
//  Checklists
//
//  Created by Nima Akbarzade on 8/6/20.
//  Copyright © 2020 padidar. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK:- Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row == 0 {
            label.text = "Walk the dog"
        } else if indexPath.row == 1 {
            label.text = "brush"
        } else if indexPath.row == 2 {
            label.text = "learn ios dev"
        } else if indexPath.row == 3 {
            label.text = "soccer practice"
        } else if indexPath.row == 4 {
            label.text = "eat ice cream"
        }
        
        return cell
    }


}

