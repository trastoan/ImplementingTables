//
//  CharacterInfoHeader.swift
//  TableViewOverview
//
//  Created by Yuri on 26/04/20.
//  Copyright © 2020 academy. All rights reserved.
//

import UIKit

class CharacterInfoHeader: UIView {

    @IBOutlet var characterPortraint: UIImageView!
    @IBOutlet var characterName: UILabel!
    @IBOutlet var characterClass: UILabel!
    
    var nibName = "CharacterInfoHeader"
    var contentView: UIView?
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupXib()
    }
    
    private func setupXib() {
        guard let view = loadViewFromNib() else { fatalError("Wrong xib name") }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func configure(with char: Character) {
        characterPortraint.image = UIImage(named: char.imageName)
        characterName.text = char.name
        characterClass.text = "\(char.charClass) \(char.charLevel)"
    }
}
