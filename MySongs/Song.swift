//
//  Song.swift
//  MySongs
//
//  Created by Ant on 3/14/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(Song)
class Song: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    var songLabel: String {
        
        return "\(self.title! as String) - \(self.singer! as String)"
    }
    
    func setSongImage(_ image: UIImage) {
        let imgData = UIImagePNGRepresentation(image)
        self.image = imgData
    }
    
    func getSongImage() -> UIImage {
        let image = UIImage(data: self.image! as Data)! as UIImage
        return image
    }
    
}
