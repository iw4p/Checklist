//
//  ListDetailViewController.swift
//  Checklists
//
//  Created by Nima Akbarzade on 10/18/1397 AP.
//  Copyright © 1397 AP Nima Akbarzade. All rights reserved.
//

import Foundation
import UIKit

protocol ListDetailViewControllerDelegate: class {
    func listDetailViewControllerDidCancel(
        _ controller: ListDetailViewController)
    func listDetailViewController(
        _ controller: ListDetailViewController,
        didFinishAdding checklist: Checklist)
    func listDetailViewController(_ controller: ListDetailViewController,didFinishEditing checklist: Checklist)
}
class ListDetailViewController: UITableViewController,UITextFieldDelegate, IconPickerViewControllerDelegate{

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
        @IBOutlet weak var iconImage: UIImageView!
        weak var delegate: ListDetailViewControllerDelegate?
    var checklistToEdit: Checklist?
    var iconName = "Folder"
        
        override func viewDidLoad() {
            super.viewDidLoad()
            if let checklist = checklistToEdit {
                title = "Edit Checklist"
                textField.text = checklist.name
                doneBarButton.isEnabled = true
                iconName = checklist.iconName
            }
            iconImage.image = UIImage(named: iconName)
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            textField.becomeFirstResponder()
        }
        
    func iconPicker(_ picker: IconPickerViewController, didPick iconName: String) {
        self.iconName = iconName
        iconImage.image = UIImage(named: iconName)
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PickIcon" {
            let controller = segue.destination as! IconPickerViewController
            controller.delegate = self
        }
    }
    
        // MARK:- Actions
        @IBAction func cancel() {
            delegate?.listDetailViewControllerDidCancel(self)
        }
        @IBAction func done() {
            if let checklist = checklistToEdit {
                checklist.name = textField.text!
                checklist.iconName = iconName
                delegate?.listDetailViewController(self,
                                                   didFinishEditing: checklist)
            } else {
                let checklist = Checklist(name: textField.text!, iconName: iconName)
                delegate?.listDetailViewController(self,didFinishAdding: checklist)
            }
        }
        
        // MARK:- Table View Delegates
        override func tableView(_ tableView: UITableView,
                                willSelectRowAt indexPath: IndexPath) -> IndexPath? {
            return indexPath.section == 1 ? indexPath : nil
        }
        
        // MARK:- Text Field Delegates
        func textField(_ textField: UITextField,
                       shouldChangeCharactersIn range: NSRange,
                       replacementString string: String) -> Bool {
            let oldText = textField.text!
            let stringRange = Range(range, in:oldText)!
            let newText = oldText.replacingCharacters(in: stringRange,
                                                      with: string)
            doneBarButton.isEnabled = !newText.isEmpty
            return true
        }
        func textFieldShouldClear(_ textField: UITextField) -> Bool {
            doneBarButton.isEnabled = false
            return true
        }
        
}
