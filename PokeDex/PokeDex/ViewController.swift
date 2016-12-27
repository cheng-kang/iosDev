//
//  ViewController.swift
//  PokeDex
//
//  Created by Ant on 3/16/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var pokemons = [PokeMon]()
    var filteredPokemon = [PokeMon]()
    var inSearchMode = false
    var bgMusic: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //init collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        //init searchBar
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.Done
        
        //add tap gesture recognizer
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        //init pokemon data
        parsePokeMonCSV()
        
        //init audios
        initAudio()
        //play backround music
        bgMusic.play()
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    func initAudio() {
        
        let path = NSBundle.mainBundle().pathForResource("music", ofType: "mp3")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try bgMusic = AVAudioPlayer(contentsOfURL: soundUrl)
            bgMusic.prepareToPlay()
            bgMusic.numberOfLoops = -1
        } catch {
            
        }
    }
    
    @IBAction func backgroundAudioButtonPressed(sender: UIButton) {
        if bgMusic.playing {
            bgMusic.pause()
            sender.setImage(UIImage(named: "music_off"), forState: .Normal)
        }else{
            bgMusic.play()
            sender.setImage(UIImage(named: "music_on"), forState: .Normal)
        }
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
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell {
            var pokemon: PokeMon
            if inSearchMode {
                pokemon = filteredPokemon[indexPath.row]
            } else {
                pokemon = pokemons[indexPath.row]
            }
            
            cell.configureCell(pokemon)
            return cell
        }else{
            return PokeCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        var pokemon: PokeMon!
        
        if inSearchMode {
            pokemon = filteredPokemon[indexPath.row]
        } else {
            pokemon = pokemons[indexPath.row]
        }
        
        performSegueWithIdentifier("PokeMonDetailSegue", sender: pokemon)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode {
            return filteredPokemon.count
        } else {
            return pokemons.count
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(105, 125)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            collectionView.reloadData()
        } else {
            inSearchMode = true
            let lowercaseString = searchBar.text!.lowercaseString
            filteredPokemon = pokemons.filter({($0.name.lowercaseString.rangeOfString(lowercaseString) != nil)||($0.id.lowercaseString.rangeOfString(lowercaseString) != nil)||($0.typeName.lowercaseString.rangeOfString(lowercaseString) != nil)})
            collectionView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PokeMonDetailSegue" {
            if let detailsVC = segue.destinationViewController as? PokeMonDetailViewController {
                if let pokemon = sender as? PokeMon {
                    detailsVC.pokemon = pokemon
                }
            }
        }
    }

}

