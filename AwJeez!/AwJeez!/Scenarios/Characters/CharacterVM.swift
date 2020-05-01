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
    var isLoadingNew = false
    init(_ vc:CharacterVC) {
        self.vc = vc
    }
    func getCharacters() {
        isLoadingNew = true
        WebServices.init().getCharacters(page: vc.currentPage ,success: { [weak self](characters) in
            guard let selfie = self else{return}
            selfie.isLoadingNew = false
            if let characters = characters.results as? JResCharacter {
                selfie.vc.characters.append(contentsOf: characters.results)
            }
            selfie.vc.updateViews()
        },failure:  {[weak self] (response) in
            guard let selfie = self else{return}
            selfie.isLoadingNew = false
        })
    }
}
