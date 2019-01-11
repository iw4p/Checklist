//
//  Checklist.swift
//  Checklists
//
//  Created by Nima Akbarzade on 10/18/1397 AP.
//  Copyright © 1397 AP Nima Akbarzade. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var items = [ChecklistItem]()
    init(name: String) {
        self.name = name
        super.init()
    }
}
