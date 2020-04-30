//
//  DatabaseHandler.swift
//  AwJeez!
//
//  Created by Farbod on 4/30/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation
import RealmSwift
func DatabaseHelper() {
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
        rFavChar.episode = character.episode
        rFavChar.url = character.url
        rFavChar.created = character.created
        let realm = try! Realm()
        try! realm.write {
            realm.add(rFavChar)
        }
    
    }
    func fetchFavorites() -> Results<RFavCharacter>{
        let realm = try! Realm()
        let result = realm.objects(RFavCharacter.self)
        return result
    }
    
}

