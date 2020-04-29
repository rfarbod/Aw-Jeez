//
//  JLocation.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation
import Arrow
struct JLocation:ArrowParsable {
    var name = String()
    var url = String()
    mutating func deserialize(_ json: JSON) {
        name <-- json["name"]
        url <-- json["url"]
    }
}
