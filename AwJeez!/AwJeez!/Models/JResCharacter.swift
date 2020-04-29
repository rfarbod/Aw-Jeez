//
//  JResCharacter.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation
import Arrow
struct JResCharacter:ArrowParsable {
    var results = [JCharacter]()
    mutating func deserialize(_ json: JSON) {
        results <-- json["results"]
    }
}
