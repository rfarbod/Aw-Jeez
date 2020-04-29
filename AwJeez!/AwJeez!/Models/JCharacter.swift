//
//  CharacterModel.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation
import Arrow
struct JCharacter:ArrowParsable {
    var id = Int()
    var name = String()
    var status:Status = .Unknown
    var type = String()
    var species = String()
    var gender = String()
    var origin = String()
    var location = String()
    var image = String()
    var episode = [String]()
    var url = String()
    var created = String()
    mutating func deserialize(_ json: JSON) {
        id <-- json["id"]
        name <-- json["name"]
        var statusString = String()
        statusString <-- json["status"]
        switch statusString {
        case "Alive":
            status = .Alive
        case "Dead":
            status = .Dead
        case "unknown":
            status = .Unknown
        default:
            break
        }
        type <-- json["type"]
        species <-- json["species"]
        gender <-- json["gender"]
        origin <-- json["origin"]
        location <-- json["location"]
        image <-- json["image"]
        episode <-- json["episode"]
        url <-- json["url"]
        created <-- json["created"]
    }
}
enum Status:Int  {
    case Alive = 1
    case Dead  = 0
    case Unknown = -1
}



