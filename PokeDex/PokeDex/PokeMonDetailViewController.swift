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
                self.nextPokeMonImg.hidden = true
                self.nextPokeMonLbl.hidden = true
                self.evoArrowImg.hidden = true
            }
        }
    }

    func initLayout() {
        
        bannerView.layer.backgroundColor = pokemon.typeColor.CGColor
        
        bgView.layer.cornerRadius = 5.0
        bgView.layer.backgroundColor = pokemon.typeColor.CGColor
        leftPanelView.layer.cornerRadius = 5.0
//        leftPanelView.layer.borderWidth = 1.0
        leftPanelView.layer.borderColor = UIColor.grayColor().CGColor
        rightPanelView.layer.cornerRadius = 5.0
//        rightPanelView.layer.borderWidth = 1.0
        rightPanelView.layer.borderColor = UIColor.grayColor().CGColor
//        rightPanelView.layer.backgroundColor = pokemon.typeColor.CGColor
        
//        noLbl.layer.borderWidth = 1.0
        noLbl.layer.borderColor = UIColor.grayColor().CGColor
        noLbl.layer.backgroundColor = UIColor.whiteColor().CGColor
        noLbl.layer.cornerRadius = 5.0
//        noValueLbl.layer.borderWidth = 1.0
        noValueLbl.layer.borderColor = UIColor.grayColor().CGColor
        noValueLbl.layer.backgroundColor = UIColor.whiteColor().CGColor
        noValueLbl.layer.cornerRadius = 5.0
//        typeLbl.layer.borderWidth = 1.0
        typeLbl.layer.borderColor = UIColor.grayColor().CGColor
        typeLbl.layer.backgroundColor = UIColor.whiteColor().CGColor
        typeLbl.layer.cornerRadius = 5.0
//        typeValueLbl.layer.borderWidth = 1.0
        typeValueLbl.layer.borderColor = UIColor.grayColor().CGColor
        typeValueLbl.layer.backgroundColor = UIColor.whiteColor().CGColor
        typeValueLbl.layer.cornerRadius = 5.0
//        weightLbl.layer.borderWidth = 1.0
        weightLbl.layer.borderColor = UIColor.grayColor().CGColor
        weightLbl.layer.backgroundColor = UIColor.whiteColor().CGColor
        weightLbl.layer.cornerRadius = 5.0
//        weightValueLbl.layer.borderWidth = 1.0
        weightValueLbl.layer.borderColor = UIColor.grayColor().CGColor
        weightValueLbl.layer.backgroundColor = UIColor.whiteColor().CGColor
        weightValueLbl.layer.cornerRadius = 5.0
//        heightLbl.layer.borderWidth = 1.0
        heightLbl.layer.borderColor = UIColor.grayColor().CGColor
        heightLbl.layer.backgroundColor = UIColor.whiteColor().CGColor
        heightLbl.layer.cornerRadius = 5.0
//        heightValueLbl.layer.borderWidth = 1.0
        heightValueLbl.layer.borderColor = UIColor.grayColor().CGColor
        heightValueLbl.layer.backgroundColor = UIColor.whiteColor().CGColor
        heightValueLbl.layer.cornerRadius = 5.0
//        hpLbl.layer.borderWidth = 1.0
        hpLbl.layer.borderColor = UIColor.grayColor().CGColor
        hpLbl.layer.backgroundColor = UIColor.whiteColor().CGColor
        hpLbl.layer.cornerRadius = 5.0
//        hpValueLbl.layer.borderWidth = 1.0
        hpValueLbl.layer.borderColor = UIColor.grayColor().CGColor
        hpValueLbl.layer.backgroundColor = UIColor.whiteColor().CGColor
        hpValueLbl.layer.cornerRadius = 5.0
//        attackLbl.layer.borderWidth = 1.0
        attackLbl.layer.borderColor = UIColor.grayColor().CGColor
        attackLbl.layer.backgroundColor = UIColor.whiteColor().CGColor
        attackLbl.layer.cornerRadius = 5.0
//        attackValueLbl.layer.borderWidth = 1.0
        attackValueLbl.layer.borderColor = UIColor.grayColor().CGColor
        attackValueLbl.layer.backgroundColor = UIColor.whiteColor().CGColor
        attackValueLbl.layer.cornerRadius = 5.0
//        defenceLbl.layer.borderWidth = 1.0
        defenseLbl.layer.borderColor = UIColor.grayColor().CGColor
        defenseLbl.layer.backgroundColor = UIColor.whiteColor().CGColor
        defenseLbl.layer.cornerRadius = 5.0
//        defenseValueLbl.layer.borderWidth = 1.0
        defenseValueLbl.layer.borderColor = UIColor.grayColor().CGColor
        defenseValueLbl.layer.backgroundColor = UIColor.whiteColor().CGColor
        defenseValueLbl.layer.cornerRadius = 5.0
        
        
        descValueLbl.sizeToFit()
        descValueLbl.numberOfLines = 0
//        descValueLbl.layer.borderWidth = 1.0
        descValueLbl.layer.borderColor = UIColor.grayColor().CGColor
        descValueLbl.layer.backgroundColor = UIColor.whiteColor().CGColor
        descValueLbl.layer.cornerRadius = 5.0
        
        currentPokeMonImg.image = pokemon.img
        currentPokeMonLbl.text = pokemon.name
        noValueLbl.text = pokemon.id
        typeValueLbl.text = pokemon.typeName
    }
    @IBAction func backButtonPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
