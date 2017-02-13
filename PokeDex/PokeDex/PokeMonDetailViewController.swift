//
//  PokeMonDetailViewController.swift
//  PokeDex
//
//  Created by Ant on 3/17/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class PokeMonDetailViewController: UIViewController {

    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var leftPanelView: UIView!
    @IBOutlet weak var rightPanelView: UIView!
    @IBOutlet weak var currentPokeMonImg: UIImageView!
    @IBOutlet weak var currentPokeMonLbl: UILabel!
    @IBOutlet weak var nextPokeMonImg: UIImageView!
    @IBOutlet weak var nextPokeMonLbl: UILabel!
    @IBOutlet weak var noLbl: UILabel!
    @IBOutlet weak var noValueLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var typeValueLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var weightValueLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var heightValueLbl: UILabel!
    @IBOutlet weak var hpLbl: UILabel!
    @IBOutlet weak var hpValueLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var attackValueLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var defenseValueLbl: UILabel!
    @IBOutlet weak var descValueLbl: UILabel!
    
    @IBOutlet weak var evoArrowImg: UIImageView!
    
    var pokemon: PokeMon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLayout()
        pokemon.downloadPokeMonDetails { () -> () in
            self.weightValueLbl.text = self.pokemon.weight
            self.heightValueLbl.text = self.pokemon.height
            self.hpValueLbl.text = self.pokemon.hp
            self.attackValueLbl.text = self.pokemon.attack
            self.defenseValueLbl.text = self.pokemon.defense
            
            self.descValueLbl.text = self.pokemon.desc
            self.nextPokeMonLbl.text = self.pokemon.evoName
            self.nextPokeMonImg.image = UIImage(named: self.pokemon.evoID)
            
            if self.pokemon.evoID == "0" {
                self.nextPokeMonImg.isHidden = true
                self.nextPokeMonLbl.isHidden = true
                self.evoArrowImg.isHidden = true
            }
        }
    }

    func initLayout() {
        
        bannerView.layer.backgroundColor = pokemon.typeColor.cgColor
        
        bgView.layer.cornerRadius = 5.0
        bgView.layer.backgroundColor = pokemon.typeColor.cgColor
        leftPanelView.layer.cornerRadius = 5.0
//        leftPanelView.layer.borderWidth = 1.0
        leftPanelView.layer.borderColor = UIColor.gray.cgColor
        rightPanelView.layer.cornerRadius = 5.0
//        rightPanelView.layer.borderWidth = 1.0
        rightPanelView.layer.borderColor = UIColor.gray.cgColor
//        rightPanelView.layer.backgroundColor = pokemon.typeColor.CGColor
        
//        noLbl.layer.borderWidth = 1.0
        noLbl.layer.borderColor = UIColor.gray.cgColor
        noLbl.layer.backgroundColor = UIColor.white.cgColor
        noLbl.layer.cornerRadius = 5.0
//        noValueLbl.layer.borderWidth = 1.0
        noValueLbl.layer.borderColor = UIColor.gray.cgColor
        noValueLbl.layer.backgroundColor = UIColor.white.cgColor
        noValueLbl.layer.cornerRadius = 5.0
//        typeLbl.layer.borderWidth = 1.0
        typeLbl.layer.borderColor = UIColor.gray.cgColor
        typeLbl.layer.backgroundColor = UIColor.white.cgColor
        typeLbl.layer.cornerRadius = 5.0
//        typeValueLbl.layer.borderWidth = 1.0
        typeValueLbl.layer.borderColor = UIColor.gray.cgColor
        typeValueLbl.layer.backgroundColor = UIColor.white.cgColor
        typeValueLbl.layer.cornerRadius = 5.0
//        weightLbl.layer.borderWidth = 1.0
        weightLbl.layer.borderColor = UIColor.gray.cgColor
        weightLbl.layer.backgroundColor = UIColor.white.cgColor
        weightLbl.layer.cornerRadius = 5.0
//        weightValueLbl.layer.borderWidth = 1.0
        weightValueLbl.layer.borderColor = UIColor.gray.cgColor
        weightValueLbl.layer.backgroundColor = UIColor.white.cgColor
        weightValueLbl.layer.cornerRadius = 5.0
//        heightLbl.layer.borderWidth = 1.0
        heightLbl.layer.borderColor = UIColor.gray.cgColor
        heightLbl.layer.backgroundColor = UIColor.white.cgColor
        heightLbl.layer.cornerRadius = 5.0
//        heightValueLbl.layer.borderWidth = 1.0
        heightValueLbl.layer.borderColor = UIColor.gray.cgColor
        heightValueLbl.layer.backgroundColor = UIColor.white.cgColor
        heightValueLbl.layer.cornerRadius = 5.0
//        hpLbl.layer.borderWidth = 1.0
        hpLbl.layer.borderColor = UIColor.gray.cgColor
        hpLbl.layer.backgroundColor = UIColor.white.cgColor
        hpLbl.layer.cornerRadius = 5.0
//        hpValueLbl.layer.borderWidth = 1.0
        hpValueLbl.layer.borderColor = UIColor.gray.cgColor
        hpValueLbl.layer.backgroundColor = UIColor.white.cgColor
        hpValueLbl.layer.cornerRadius = 5.0
//        attackLbl.layer.borderWidth = 1.0
        attackLbl.layer.borderColor = UIColor.gray.cgColor
        attackLbl.layer.backgroundColor = UIColor.white.cgColor
        attackLbl.layer.cornerRadius = 5.0
//        attackValueLbl.layer.borderWidth = 1.0
        attackValueLbl.layer.borderColor = UIColor.gray.cgColor
        attackValueLbl.layer.backgroundColor = UIColor.white.cgColor
        attackValueLbl.layer.cornerRadius = 5.0
//        defenceLbl.layer.borderWidth = 1.0
        defenseLbl.layer.borderColor = UIColor.gray.cgColor
        defenseLbl.layer.backgroundColor = UIColor.white.cgColor
        defenseLbl.layer.cornerRadius = 5.0
//        defenseValueLbl.layer.borderWidth = 1.0
        defenseValueLbl.layer.borderColor = UIColor.gray.cgColor
        defenseValueLbl.layer.backgroundColor = UIColor.white.cgColor
        defenseValueLbl.layer.cornerRadius = 5.0
        
        
        descValueLbl.sizeToFit()
        descValueLbl.numberOfLines = 0
//        descValueLbl.layer.borderWidth = 1.0
        descValueLbl.layer.borderColor = UIColor.gray.cgColor
        descValueLbl.layer.backgroundColor = UIColor.white.cgColor
        descValueLbl.layer.cornerRadius = 5.0
        
        currentPokeMonImg.image = pokemon.img
        currentPokeMonLbl.text = pokemon.name
        noValueLbl.text = pokemon.id
        typeValueLbl.text = pokemon.typeName
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
