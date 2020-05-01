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
    var isFavorite = false
    override func awakeFromNib() {
        super.awakeFromNib()
        EventsHelper.observeFavorites(self, with: #selector(favoritesUpdates(notification:)))
        let favGesture = UITapGestureRecognizer(target: self, action: #selector(pressedFav))
        imgFav.isUserInteractionEnabled = true
        imgFav.addGestureRecognizer(favGesture)
        // Initialization code
    }
    @objc func pressedFav() {
       switch isFavorite {
        case true:
            DatabaseHandler.shared.removeFavorite(character: character)
            self.isFavorite = false
            EventsHelper.favoriteUpdated(character.id, favoriteState: false)
        case false:
            DatabaseHandler.shared.addFavorite(character: character)
            self.isFavorite = true
           EventsHelper.favoriteUpdated(character.id, favoriteState: true)
        }
      
    }
    @objc func favoritesUpdates(notification:Notification) {
        if let userInfo = notification.userInfo {
            if let id = userInfo["id"] as? Int {
                if id == character.id {
                    if let state = userInfo["state"] as? Bool {
                        switch state {
                        case true:
                            self.imgFav.image = UIImage(named: "like")
                        case false:
                            self.imgFav.image = UIImage(named: "unlike")
                        }
                    }
                }
            }
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
        let isFavorite = DatabaseHandler.shared.isFavorite(character: character)
        self.isFavorite = isFavorite
        switch isFavorite {
        case true:
            self.imgFav.image = UIImage(named: "like")
        case false:
            self.imgFav.image = UIImage(named: "unlike")
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
