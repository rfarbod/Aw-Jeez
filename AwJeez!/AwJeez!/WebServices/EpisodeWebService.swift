//
//  EpisodeWebService.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation
extension WebServices {
    func getEpsiodes(url:String,success:@escaping Success,failure:@escaping Failure) {
        WebServices.request(url: url,resultType: JEpisode.self, success: success, failure: failure)
    }
}
