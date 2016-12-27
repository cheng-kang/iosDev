//
//  EmojiListCollectionViewController.swift
//  Emoji
//
//  Created by Ant on 16/9/15.
//  Copyright © 2016年 Ant. All rights reserved.
//

import UIKit
import Messages

private let reuseIdentifier = "Cell"

class EmojiListCollectionViewController: UICollectionViewController {
    
    static let storyboardIdentifier = "EmojiListCollectionViewController"
    
    var PackName: String?
    var size: CGFloat!
    
    var modalView = UIView()
    var stickerView = CustonStickerView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        size = CGFloat(UserDefaults.standard.integer(forKey: "EmojiSize"))
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(EmojiListCollectionViewController.dismissModal))
        modalView.addGestureRecognizer(tap)
    }
    
    func dismissModal() {
        self.modalView.alpha = 0
        self.stickerView.alpha = 0
        self.stickerView.sticker = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 50)
        
        self.view.addSubview(modalView)
        
        modalView.backgroundColor = UIColor.white
        modalView.alpha = 0
        
        self.modalView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 50)
        
        self.stickerView.frame = CGRect(x: self.view.frame.width / 2 - size / 2, y: 100 - size / 2, width: size, height: size)
        self.stickerView.alpha = 0
        self.view.insertSubview(stickerView, aboveSubview: modalView)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    deinit {
        self.collectionView?.delegate = nil
        self.collectionView?.dataSource = nil
        self.collectionView = nil
        self.PackName = nil
        self.removeFromParentViewController()
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
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if  PackName == "Apple" {
            return 845 + 1
        }
        
        if PackName == "Emoji One" {
            return 1577 + 1
        }
        
        if PackName == "Google" {
            return 837 + 1
        }
        
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BackCell", for: indexPath)
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListImageCell", for: indexPath) as! ListImageCell
            
            var imageName = ""
            if PackName == "Google" {
                imageName = "Google-\(indexPath.row)"
            }
            if PackName == "Emoji One" {
                imageName = "emojione-\(indexPath.row)"
            }
            if PackName == "Apple" {
                let row = indexPath.row
                if row <= 189 {
                    imageName = "Apple-Smiley-\(row)"
                } else if row <= 189 + 116 {
                    imageName = "Apple-Nature-\(row-189)"
                } else if row <= 189 + 116 + 230 {
                    imageName = "Apple-Objects-\(row-189-116)"
                } else if row <= 189 + 116 + 230 + 209 {
                    imageName = "Apple-Symbols-\(row-189-116-230)"
                } else if row <= 189 + 116 + 230 + 209 + 101 {
                    imageName = "Apple-Orte-\(row-189-116-230-209)"
                }
            }
            
            
            cell.imageName = imageName
//            cell.lp = { [unowned self] in
//                self.modalView.alpha = 1
//            }
//            cell.StickerView.sticker = getStickerByImageName(name: imageName, description: imageName)
//            cell.StickerView.imageName = imageName
            
            return cell
        }
        
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            self.dismiss(animated: true, completion: {
            })
            
        } else {
            let imageName = (collectionView.cellForItem(at: indexPath) as! ListImageCell).imageName!
            self.stickerView.imageName = imageName
            self.stickerView.sticker = getStickerByImageName(name: imageName, description: imageName)
            self.modalView.alpha = 0.9
            self.stickerView.alpha = 1
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if indexPath.row != 0 {
//            (cell as! ListImageCell).imageView.image = nil
//        }
    }

}

extension EmojiListCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if indexPath.row == 0 {
            return CGSize(width: self.view.frame.width, height: 30)
        } else {
            return CGSize(width: size, height: size)
        }
    }
}
