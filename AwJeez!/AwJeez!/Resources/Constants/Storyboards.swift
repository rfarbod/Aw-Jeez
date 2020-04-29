//
//  Storyboards.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation
import UIKit
class Storyboards {
class Main {
    static let main = UIStoryboard(name:"Main", bundle:Bundle.main)
    static var charVC:CharacterVC {
        return main.instantiateViewController(withIdentifier: "charVC") as! CharacterVC
    }
    static var epVC:EpisodeVC {
        return main.instantiateViewController(identifier: "epVC") as! EpisodeVC
    }
}
}
