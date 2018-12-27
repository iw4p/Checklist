//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Nima Akbarzade on 10/7/1397 AP.
//  Copyright © 1397 AP Nima Akbarzade. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    func toggleChecked() {
        checked = !checked
    }
}
