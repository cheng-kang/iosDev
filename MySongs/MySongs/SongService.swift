//
//  SongService.swift
//  MySongs
//
//  Created by Ant on 3/14/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class SongService {
    static let instance = SongService()
    
    var _songs = [Song]()
    
    var songs: [Song] {
        return _songs
    }
    
    func addSong(_ image: UIImage, title: String, singer: String, lyric: String) {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.managedObjectContext
        let entity = NSEntityDescription.entity(forEntityName: "Song", in: context)
        let song = Song(entity: entity!, insertInto: context)
        
        song.title = title
        song.singer = singer
        song.lyric = lyric
        song.setSongImage(image)
        
        context.insert(song)
        
        do {
            try context.save()
            loadSongs()
        } catch {
            print(error)
        }
        
    }
    
    func loadSongs() {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Song")
        do {
            let results = try context.fetch(fetchRequest)
            self._songs = results as! [Song]
        } catch {
            print(error)
        }
    }
}
