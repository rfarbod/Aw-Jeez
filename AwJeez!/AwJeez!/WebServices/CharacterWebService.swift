//
//  CharacterWebService.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation
extension WebServices {
    func getCharacters(success:@escaping Success,failure:@escaping Failure) {
        WebServices.request(url: MyURLs.characters , resultType: JResCharacter.self, success: success, failure: failure)
    }
}
