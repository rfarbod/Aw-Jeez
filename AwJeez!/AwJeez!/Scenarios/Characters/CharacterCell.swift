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
    @IBOutlet weak var imgFav: UIImageView!
    @IBOutlet weak var lblSpecies: UILabel!
    var character = JCharacter()
    override func awakeFromNib() {
        super.awakeFromNib()
        let favGesture = UITapGestureRecognizer(target: self, action: #selector(pressedFav))
        imgFav.isUserInteractionEnabled = true
        imgFav.addGestureRecognizer(favGesture)
        // Initialization code
    }
    @objc func pressedFav() {
        let isFavorite = DatabaseHandler.init().isFavorite(character: character)
        switch isFavorite {
        case true:
            DatabaseHandler.init().removeFavorite(character: character)
            imgFav.image = UIImage(named: "unlike")
        case false:
            DatabaseHandler.init().addFavorite(character: character)
            imgFav.image = UIImage(named: "like")
        }
    }
    func configure(with character: JCharacter) {
        self.character = character
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
        let isFavorite = DatabaseHandler.init().isFavorite(character: character)
        switch isFavorite {
        case true:
            imgFav.image = UIImage(named: "like")
        case false:
            imgFav.image = UIImage(named: "unlike")
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
