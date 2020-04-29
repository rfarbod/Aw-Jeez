//
//  CharacterVM.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation
class CharacterVM {
    weak var vc:CharacterVC!
    init(_ vc:CharacterVC) {
        self.vc = vc
    }
    func getCharacters() {
        WebServices.init().getCharacters(success: { [weak self](characters) in
            guard let selfie = self else{return}
            if let characters = characters.results as? JResCharacter {
                selfie.vc.characters = characters.results
            }
            selfie.vc.updateViews()
        },failure:  { (response) in
            
        })
    }
}
