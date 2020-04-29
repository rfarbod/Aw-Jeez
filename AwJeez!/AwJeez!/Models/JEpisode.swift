//
//  JEpisode.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//
import Foundation
import Arrow
struct JEpisode:ArrowParsable {
    var id = Int()
    var name = String()
    var airDate = String()
    var episode = String()
    var url = String()
    var created = String()
    mutating func deserialize(_ json: JSON) {
        id <-- json["id"]
        name <-- json["name"]
        airDate <-- json["air_date"]
        episode <-- json["episode"]
        url <-- json["url"]
        created <-- json["created"]
    }
}
