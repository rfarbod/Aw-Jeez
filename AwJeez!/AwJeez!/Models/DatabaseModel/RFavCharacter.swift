//
//  RFavCharacter.swift
//  AwJeez!
//
//  Created by Farbod on 4/30/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation
import RealmSwift
import Realm
class RFavCharacter:Object {
    @objc dynamic var id = Int()
    @objc dynamic var name = String()
    @objc dynamic var status = String()
    @objc dynamic var type = String()
    @objc dynamic var species = String()
    @objc dynamic var gender = String()
    @objc dynamic var origin = String()
    @objc dynamic var location = String()
    @objc dynamic var image = String()
    dynamic var episode = List<String>()
    @objc dynamic var url = String()
    @objc dynamic var created = String()
    }
