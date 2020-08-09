//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Nima Akbarzade on 8/7/20.
//  Copyright © 2020 padidar. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var textField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK:- Actions
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        print("text: \(textField.text!)")
        navigationController?.popViewController(animated: true)
    }
    
}
