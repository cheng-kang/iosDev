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
        searchBar.returnKeyType = UIReturnKeyType.done
        
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
        
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")
        let soundUrl = URL(fileURLWithPath: path!)
        
        do {
            try bgMusic = AVAudioPlayer(contentsOf: soundUrl)
            bgMusic.prepareToPlay()
            bgMusic.numberOfLoops = -1
        } catch {
            
        }
    }
    
    @IBAction func backgroundAudioButtonPressed(_ sender: UIButton) {
        if bgMusic.isPlaying {
            bgMusic.pause()
            sender.setImage(UIImage(named: "music_off"), for: UIControlState())
        }else{
            bgMusic.play()
            sender.setImage(UIImage(named: "music_on"), for: UIControlState())
        }
    }
    
    func parsePokeMonCSV() {
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
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
        let path = Bundle.main.path(forResource: "pokemon_types", ofType: "csv")!
        
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var pokemon: PokeMon!
        
        if inSearchMode {
            pokemon = filteredPokemon[indexPath.row]
        } else {
            pokemon = pokemons[indexPath.row]
        }
        
        performSegue(withIdentifier: "PokeMonDetailSegue", sender: pokemon)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode {
            return filteredPokemon.count
        } else {
            return pokemons.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 105, height: 125)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            collectionView.reloadData()
        } else {
            inSearchMode = true
            let lowercaseString = searchBar.text!.lowercased()
            filteredPokemon = pokemons.filter({($0.name.lowercased().range(of: lowercaseString) != nil)||($0.id.lowercased().range(of: lowercaseString) != nil)||($0.typeName.lowercased().range(of: lowercaseString) != nil)})
            collectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokeMonDetailSegue" {
            if let detailsVC = segue.destination as? PokeMonDetailViewController {
                if let pokemon = sender as? PokeMon {
                    detailsVC.pokemon = pokemon
                }
            }
        }
    }

}

