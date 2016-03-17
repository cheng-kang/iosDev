//
//  ViewController.swift
//  PokeDex
//
//  Created by Ant on 3/16/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var pokemons = [PokeMon]()
    
    var bgMusic: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        parsePokeMonCSV()
        
        //play backround music
        let path = NSBundle.mainBundle().pathForResource("music", ofType: "mp3")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try bgMusic = AVAudioPlayer(contentsOfURL: soundUrl)
            bgMusic.prepareToPlay()
        } catch {
            
        }
        
        bgMusic.play()
    }
    func parsePokeMonCSV() {
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            if let types = getTypesFromCSV() as? Dictionary<String, String> {
                for row in rows{
                    let id = row["id"]!
                    let name = row["identifier"]!
                    let pokemon = PokeMon(id: id, name: name, type: types[row["id"]!]!)
                    pokemons.append(pokemon)
                }
            }
            
        } catch {
            print(error)
        }
    }
    
    func getTypesFromCSV() -> Dictionary<String, String> {
        let path = NSBundle.mainBundle().pathForResource("pokemon_types", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            var types = Dictionary<String, String>()
            for row in rows{
                let keyNotExists = types[row["pokemon_id"]!] == nil
                if keyNotExists {
                    types[row["pokemon_id"]!] = row["type_id"]!
                }
                
            }
            return types
        } catch {
            print(error)
        }
        
        return Dictionary<String, String>()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let pokemon = pokemons[indexPath.row]
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell {
            cell.configureCell(pokemon)
            return cell
        }else{
            let cell = PokeCell()
            cell.configureCell(pokemon)
            return cell
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(105, 125)
    }
    

}

