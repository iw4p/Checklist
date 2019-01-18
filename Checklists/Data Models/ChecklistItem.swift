//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Nima Akbarzade on 10/7/1397 AP.
//  Copyright © 1397 AP Nima Akbarzade. All rights reserved.
//

import Foundation
import UserNotifications

class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = false
    
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1
    
    func toggleChecked() {
        checked = !checked
    }
    
    func scheduleNotification() {
        removeNotification()
        if shouldRemind && dueDate > Date() {
            let content = UNMutableNotificationContent()
            content.title = "Reminder:"
            content.body = text
            content.sound = UNNotificationSound.default
            
            let calender = Calendar(identifier: .gregorian)
            let components = calender.dateComponents([.year, .month, .hour, .minute], from: dueDate)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            
            let request = UNNotificationRequest(identifier: "\(itemID)", content: content, trigger: trigger)

            let center = UNUserNotificationCenter.current()
            center.add(request)
            print("Scheduled: \(request) for itemID: \(itemID)")
        }
    }
    
    func removeNotification() {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: ["\(itemID)"])
    }
    
    override init() {
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
    
    deinit {
        removeNotification()
    }
}
