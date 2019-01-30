//
//  SettingTableViewController.swift
//  Mazboor
//
//  Created by Nima Akbarzade on 11/7/1397 AP.
//  Copyright © 1397 AP Nima Akbarzade. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    let defaults = UserDefaults()
    
    @IBOutlet var labels: [UILabel]!
    
    //    let darkMode = UserDefaults.standard.bool(forKey: "isDarkMode")

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
//
//        self.clearsSelectionOnViewWillAppear = false
//        
//        darkModeSwitch.isOn = UserDefaults.standard.bool(forKey: "isDarkMode")
//        
//        NotificationCenter.default.addObserver(self, selector: #selector(darkModeEnabled(_:)), name: .darkModeEnabled, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(darkModeDisabled(_:)), name: .darkModeDisabled, object: nil)

        
    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        UserDefaults.standard.bool(forKey: "isDarkMode") ? enableDarkMode() : disableDarkMode()
//
//    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .darkModeEnabled, object: nil)
        NotificationCenter.default.removeObserver(self, name: .darkModeDisabled, object: nil)
    }
    
    // MARK: - Theme
    
    @objc func darkModeEnabled(_ notification: Notification) {
        enableDarkMode()
        self.tableView.reloadData()
    }
    
    @objc func darkModeDisabled(_ notification: Notification) {
        disableDarkMode()
        self.tableView.reloadData()
    }

    open func enableDarkMode() {
        self.view.backgroundColor = UIColor.black
        self.tableView.backgroundColor = UIColor.black
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.view.backgroundColor = UIColor.black
    }
    
    open func disableDarkMode() {
        self.view.backgroundColor = UIColor.white
        self.tableView.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.view.backgroundColor = UIColor.white
    }
    
    
    
    @IBAction func darkMode(_ sender: UISwitch) {
        
        UserDefaults.standard.set(sender.isOn, forKey: "isDarkMode")
        
        NotificationCenter.default.post(name: sender.isOn ? .darkModeEnabled : .darkModeDisabled, object: nil)
    }
    
    @IBAction func githubButton(_ sender: Any) {
        if let url = URL(string: "https://github.com/iw4p/Checklist") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBAction func donateButton(_ sender: Any) {
        if let url = URL(string: "https://ppng.ir/nimk") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//        if UserDefaults.standard.bool(forKey: "isDarkMode") {
//            cell.textLabel?.textColor = UIColor.white
//            cell.detailTextLabel?.textColor = UIColor.white
//            cell.backgroundColor = UIColor.black
//
////            cell.setSelectedColor(color: UIColor.darkBackground)
//        }
//        else {
//            cell.textLabel?.textColor = UIColor.black
//            cell.detailTextLabel?.textColor = UIColor.black
//            cell.backgroundColor = UIColor.white
//
////            cell.setSelectedColor(color: UIColor.lightBackground)
//        }
//    }
    
}
