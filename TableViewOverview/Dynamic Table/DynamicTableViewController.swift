//
//  DynamicTableViewController.swift
//  TableViewOverview
//
//  Created by Yuri on 26/04/20.
//  Copyright © 2020 academy. All rights reserved.
//

import UIKit

class DynamicTableViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var tableHeader: CharacterInfoHeader!
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        character = Character.makeAnna()
        title = "Dynamic Table"
        
        configureTable()
    }
    
    private func configureTable() {
        //Configure table delegate and data source
        table.delegate = self
        table.dataSource = self
        
        //Configuring the table header
        tableHeader.configure(with: character)
        
        //Registering Cells
        let cellNib = UINib(nibName: WeaponTableViewCell.xibName, bundle: nil)
        table.register(cellNib, forCellReuseIdentifier: WeaponTableViewCell.identifier)
        
        //Registering Header
        let sectionNib = UINib(nibName: WeaponsSectionHeader.xibName, bundle: nil)
        table.register(sectionNib, forHeaderFooterViewReuseIdentifier: WeaponsSectionHeader.identifier)
    }
    
    //Adding new weapon to the melee list
    @IBAction func addNewWeapon(_ sender: Any) {
        let weapon = Weapon.createDagger()
        character.meleeWeapon.insert(weapon, at: 0)
        //Begin and end updates will allow you to insert, select and delete rows with animations
        table.beginUpdates()
        let indexPath = IndexPath(row: 0, section: 0)
        //Here on the with you can choose different animations
        table.insertRows(at: [indexPath], with: .left)
        table.endUpdates()
    }
    
}


extension DynamicTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? character.meleeWeapon.count : character.rangedWeapon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeaponTableViewCell.identifier, for: indexPath) as! WeaponTableViewCell
        let weapon = indexPath.section == 0 ? character.meleeWeapon[indexPath.row] : character.rangedWeapon[indexPath.row]
        
        cell.configure(with: weapon)
        cell.selectionStyle = .none
        
        return cell
    }
    
    // MARK: Delegate
    
    //Acts upon user cell selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weapon = indexPath.section == 0 ? character.meleeWeapon[indexPath.row] : character.rangedWeapon[indexPath.row]
        print("Selected \(weapon.name)")
    }
    
    //This function will present a section header only with a gray background and a title label
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return section == 0 ? "Melee Weapons" : "Ranged Weapons"
//    }
    
    //This will allow you to define a custom view for the section headers
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: WeaponsSectionHeader.identifier) as! WeaponsSectionHeader
        header.sectionTitle.text = section == 0 ? "Melee Weapons" : "Ranged Weapons"
        return header
    }
    
    //You must manually define the section height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    //Here you can add actions when swiping right on the cell
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let attackAction = UIContextualAction(style: .normal, title: "Atacar") { (_, _, _) in
            print("Realized an attack")
        }
        attackAction.backgroundColor = .systemBlue
        attackAction.image = UIImage(systemName: "wrench")
        
        return UISwipeActionsConfiguration(actions: [attackAction])
    }
    
    //Here you can use the default delete style for removal
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    //Here you should declare what will be done when the row is edited
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteWeapon(indexPath: indexPath, table: tableView)
        }
    }
    
    // MARK: Contextual Actions
    
    //Here is the function that will perform the deletion for the contextual action
    private func deleteWeapon(indexPath: IndexPath, table: UITableView) {
        table.beginUpdates()
        switch indexPath.section {
        case 0:
            character.meleeWeapon.remove(at: indexPath.row)
        case 1:
            character.rangedWeapon.remove(at: indexPath.row)
        default:
            break
        }
        table.deleteRows(at: [indexPath], with: .right)
        table.endUpdates()
    }
}
