//
//  PokeCell.swift
//  PokeDex
//
//  Created by Ant on 3/16/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 0.5
    }
    
    func configureCell(_ pokemon: PokeMon) {
        self.img.image = pokemon.img
        self.name.text = pokemon.name
        self.id.text = pokemon.idLbl
        
        self.name.backgroundColor = pokemon.typeColor
        self.layer.borderColor = pokemon.typeColor.cgColor
    }
}
