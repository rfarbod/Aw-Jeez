//
//  FavoritesVM.swift
//  AwJeez!
//
//  Created by Farbod on 4/30/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation
class FavoritesVM {
    weak var vc:FavoritesVC!
    init(_ vc:FavoritesVC) {
        self.vc = vc
    }
    func convertToJChar(character:RFavCharacter) -> JCharacter {
        var jCharacter = JCharacter()
        jCharacter.created = character.created
        jCharacter.gender = character.gender
        jCharacter.id = character.id
        jCharacter.image = character.image
        jCharacter.location = character.location
        jCharacter.name = character.name
        jCharacter.species = character.species
        for each in character.episode {
            jCharacter.episode.append(each)
        }
        switch character.status {
            case "Alive":
                jCharacter.status = .Alive
            case "Dead":
                jCharacter.status = .Dead
            case "Unknown":
                jCharacter.status = .Unknown
            default:
                break
            
        }
        return jCharacter
    }
    func fetchFavorites() {
        let results = DatabaseHandler.init().fetchFavorites()
        for each in results {
            self.vc.favorites.append(each)
        }
    }
}
