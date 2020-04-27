//
//  WeaponTableViewCell.swift
//  TableViewOverview
//
//  Created by Yuri on 26/04/20.
//  Copyright © 2020 academy. All rights reserved.
//

import UIKit

class WeaponTableViewCell: UITableViewCell {

    @IBOutlet weak var weaponImageView: UIImageView!
    @IBOutlet weak var weaponName: UILabel!
    @IBOutlet weak var diceImageView: UIImageView!
    @IBOutlet weak var damageLabel: UILabel!

    static let xibName = "WeaponTableViewCell"
    static let identifier = "WeaponCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with weapon: Weapon) {
        weaponImageView.image = UIImage(named: weapon.imageName)
        weaponName.text = weapon.name
        damageLabel.text = "+ \(weapon.bonus)"
    }
}
