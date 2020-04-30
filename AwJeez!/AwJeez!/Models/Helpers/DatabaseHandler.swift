//
//  DatabaseHandler.swift
//  AwJeez!
//
//  Created by Farbod on 4/30/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation
import RealmSwift
import Realm
class DatabaseHandler {
    func addFavorite(character:JCharacter) {
        let rFavChar = RFavCharacter()
        rFavChar.id = character.id
        rFavChar.name = character.name
        switch character.status {
        case .Alive:
            rFavChar.status = "Alive"
        case .Dead:
            rFavChar.status = "Dead"
        case .Unknown:
            rFavChar.status = "Unknown"
        }
        rFavChar.type = character.type
        rFavChar.species = character.species
        rFavChar.gender = character.gender
        rFavChar.origin = character.origin
        rFavChar.location = character.location
        rFavChar.image = character.image
        let episodes = List<String>()
        for each in character.episode {
            episodes.append(each)
        }
        rFavChar.episode = episodes
        rFavChar.url = character.url
        rFavChar.created = character.created
        let realm = try! Realm()
        try! realm.write {
            realm.add(rFavChar)
        }
    
    }
    func removeFavorite(character:JCharacter) {
        let realm = try! Realm()
        let result = realm.objects(RFavCharacter.self)
        if let character = result.first(where: { (char) -> Bool in
            return char.id == character.id
        }){
            try! realm.write {
                realm.delete(character)
            }
        }
    }
    func fetchFavorites() -> Results<RFavCharacter>{
        let realm = try! Realm()
        let result = realm.objects(RFavCharacter.self)
        return result
    }
    func isFavorite(character:JCharacter) -> Bool {
        let realm = try! Realm()
        let result = realm.objects(RFavCharacter.self)
        if let _ = result.first(where: { (char) -> Bool in
            return char.id == character.id
        }){
            return true
        }else{
            return false
        }
    }
    
}

