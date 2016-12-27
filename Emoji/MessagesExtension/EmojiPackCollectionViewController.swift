//
//  EmojiPackCollectionViewController.swift
//  Emoji
//
//  Created by Ant on 16/9/15.
//  Copyright © 2016年 Ant. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class EmojiPackCollectionViewController: UICollectionViewController {
    
    static let storyboardIdentifier = "EmojiPackCollectionViewController"
    
    var PacksName = ["Apple", "Google", "Emoji One"]
    
    var EmojiHistory = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        
        if let data = UserDefaults.standard.array(forKey: "EmojiHistory") {
            EmojiHistory = data as! [String]
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(EmojiPackCollectionViewController.historyChanged), name: NSNotification.Name(rawValue: "HistoryChanged"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(EmojiPackCollectionViewController.emojiSizeChanged), name: NSNotification.Name(rawValue: "EmojiSizeChanged"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 50)
    }
    
    func historyChanged() {
        if let data = UserDefaults.standard.array(forKey: "EmojiHistory") {
            EmojiHistory = data as! [String]
            self.collectionView?.reloadData()
        }
    }
    
    func emojiSizeChanged() {
        self.collectionView?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if section == 0 {
            return PacksName.count
        } else if section == 1 {
            return EmojiHistory.count
        } else if section == 2 {
            return 1
        }
        
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmojiPackCell", for: indexPath) as! EmojiPackCell
            
            cell.CoverImageView.image = UIImage(named: PacksName[indexPath.row])!
            cell.PackNameLbl.text = PacksName[indexPath.row]
            
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StickerCell", for: indexPath) as! PackStickerCell
            
            cell.StickerView.sticker = nil
            cell.StickerView.sticker = getStickerByImageName(name: EmojiHistory[indexPath.row], description: EmojiHistory[indexPath.row])
            cell.StickerView.imageName = EmojiHistory[indexPath.row]
            cell.StickerView.shouldHistoryChange = false
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmojiSizeSettingCell", for: indexPath) as! EmojiSizeSettingCell
            let size = UserDefaults.standard.integer(forKey: "EmojiSize")
            cell.sizeLbl.text = "\(size)"
            
            return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if indexPath.section == 0 {
            guard let controller = storyboard?.instantiateViewController(withIdentifier: EmojiListCollectionViewController.storyboardIdentifier) as? EmojiListCollectionViewController else { fatalError("Unable to instantiate an IceCreamsViewController from the storyboard")
            }
            
            
            controller.PackName = PacksName[indexPath.row]

            self.present(controller, animated: true, completion: {
            })
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "EmojiPackHeader", for: indexPath) as! EmojiPackHeader
            
            if indexPath.section == 0 {
                view.titlelbl.text = "Emoji Pack"
            } else if indexPath.section == 1 {
                view.titlelbl.text = "History"
            } else if indexPath.section == 2 {
                view.titlelbl.text = "Settings"
            }
            
            return view
        }
        
        return UICollectionReusableView()
    }

}

extension EmojiPackCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if indexPath.section == 0 {
            return CGSize(width: 65, height: 100)
        } else if indexPath.section == 1 {
            let size = UserDefaults.standard.integer(forKey: "EmojiSize")
            return CGSize(width: size, height: size)
        } else {
            return CGSize(width: self.view.frame.width, height: 50)
        }
    }
}
