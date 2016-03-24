//
//  TableViewCell.swift
//  Dynamic Table View Test
//
//  Created by Ant on 3/20/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var firstImg: UIImageView!
    @IBOutlet weak var second: UIImageView!
    @IBOutlet weak var third: UIImageView!
    @IBOutlet weak var fourth: UIImageView!
    @IBOutlet weak var fifth: UIImageView!
    @IBOutlet weak var sixth: UIImageView!
    @IBOutlet weak var seventh: UIImageView!
    @IBOutlet weak var eighth: UIImageView!
    @IBOutlet weak var nineth: UIImageView!
    
    @IBOutlet weak var onePic: UIImageView!
    
    @IBOutlet weak var buttonPanelTopAndFourth: NSLayoutConstraint!
    @IBOutlet weak var buttonPanelTopAndOnePicBottom: NSLayoutConstraint!
    @IBOutlet weak var buttonPanelTopAndSeventh: NSLayoutConstraint!
    @IBOutlet weak var buttonPanelTopAndFirst: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        firstImg.image = UIImage(named: "1")
        second.image = UIImage(named: "2")
        third.image = UIImage(named: "3")
        fourth.image = UIImage(named: "4")
        fifth.image = UIImage(named: "5")
        sixth.image = UIImage(named: "6")
        seventh.image = UIImage(named: "7")
        eighth.image = UIImage(named: "8")
        nineth.image = UIImage(named: "9")
        
        onePic.image = UIImage(named: "10")
    }
    
    func initCell() {
        firstImg.hidden = true
        second.hidden = true
        third.hidden = true
        fourth.hidden = true
        fifth.hidden = true
        sixth.hidden = true
        seventh.hidden = true
        eighth.hidden = true
        nineth.hidden = true
        
//        onePic.hidden = true
        
//        print(onePic.frame.size.height)
        
//        buttonPanelTopAndOnePicBottom.priority = 1000
//        buttonPanelTopAndSeventh.priority = seventh.hidden ? 250 : 800
//        buttonPanelTopAndFourth.priority = seventh.hidden && !fourth.hidden ? 1000 : 250
//        buttonPanelTopAndFirst.priority = seventh.hidden && fourth.hidden && !firstImg.hidden ? 1000 : 250
        
        buttonPanelTopAndOnePicBottom.priority = firstImg.hidden ? 1000 : 250
        buttonPanelTopAndSeventh.priority = seventh.hidden ? 250 : 1000
        buttonPanelTopAndFourth.priority = seventh.hidden && !fourth.hidden ? 1000 : 250
        buttonPanelTopAndFirst.priority = seventh.hidden && fourth.hidden && !firstImg.hidden ? 1000 : 250
        
    }

}
