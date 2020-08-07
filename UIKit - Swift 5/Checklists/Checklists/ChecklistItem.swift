//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Nima Akbarzade on 8/7/20.
//  Copyright © 2020 padidar. All rights reserved.
//

import Foundation
class ChecklistItem {
    
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked.toggle()
    }
    
}
