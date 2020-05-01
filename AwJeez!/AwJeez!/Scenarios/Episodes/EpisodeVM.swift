//
//  EpisodeVM.swift
//  AwJeez!
//
//  Created by Farbod on 5/1/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation
class EpisodeVM {
    weak var cell:EpisodeCell!
    init(_ cell:EpisodeCell) {
        self.cell = cell
    }
    func getEpisodeDetails(epUrl:String) {
        WebServices.init().getEpsiodes(url: epUrl, success: { (response) in
            if let episode = response.results as? JEpisode {
                self.cell.configureEpDetail(with: episode)
            }
        },failure: { (response) in
            
        })
    }
}
