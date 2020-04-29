//
//  CharacterCell.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import UIKit
import Spring
class CharacterCell: UITableViewCell {
    @IBOutlet weak var imgChar: DesignableImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblSpecies: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with character: JCharacter) {
        imgChar.downloadImage(url: character.image)
        lblName.text = character.name
        lblStatus.text = "\(character.status)"
        lblSpecies.text = "From \(character.species) Speicie"
        switch character.status {
        case .Alive:
            lblStatus.textColor = .systemGreen
        case .Dead:
            lblStatus.textColor = .systemRed
        case .Unknown:
            lblStatus.textColor = .systemGray
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
