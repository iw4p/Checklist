//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Nima Akbarzade on 8/7/20.
//  Copyright © 2020 padidar. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK:- Actions
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }
    
}
