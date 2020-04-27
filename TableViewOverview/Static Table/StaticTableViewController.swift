//
//  StaticTableViewController.swift
//  TableViewOverview
//
//  Created by Yuri on 26/04/20.
//  Copyright © 2020 academy. All rights reserved.
//

import UIKit

class StaticTableViewController: UITableViewController {

    @IBOutlet weak var appVersionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .systemGray6
        
        title = "Static Table"
    }
    
    @IBAction func changeNotificationPermission(_ sender: UISwitch) {
        let message = sender.isOn ? "Notifications are now enabled" : "Notifications are now disabled"
        print(message)
    }
    
    @IBAction func changeNotificationVolume(_ sender: UISlider) {
        print("Volume changed to \(sender.value * 100)%")
    }
    
    @IBAction func signOut(_ sender: Any) {
        print("We are sad to see you go")
    }
}
