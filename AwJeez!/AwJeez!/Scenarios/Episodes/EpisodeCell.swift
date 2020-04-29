//
//  EpisodeCell.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

    @IBOutlet weak var lblEpName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with episodeName:String) {
        let episodeNumber =  episodeName.components(separatedBy: "https://rickandmortyapi.com/api/episode/")
        if episodeNumber.indices.contains(1) {
            lblEpName.text = "Episode \(episodeNumber[1])"
        }
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
