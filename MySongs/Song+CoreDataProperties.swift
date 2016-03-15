//
//  Song+CoreDataProperties.swift
//  MySongs
//
//  Created by Ant on 3/14/16.
//  Copyright © 2016 Ant. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Song {

    @NSManaged var title: String?
    @NSManaged var singer: String?
    @NSManaged var lyric: String?
    @NSManaged var image: NSData?

}
