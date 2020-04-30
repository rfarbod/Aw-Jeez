//
//  CharacterCell.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import UIKit
import Spring
class FavCell: UITableViewCell {
    @IBOutlet weak var imgChar: DesignableImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var imgFav: UIImageView!
    @IBOutlet weak var lblSpecies: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblOrigin: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var tblEpisodes: UITableView!
    @IBOutlet weak var cnsTblHeight: NSLayoutConstraint!
    @IBOutlet weak var cnsWholeHeight: NSLayoutConstraint!
    var character = JCharacter()
    override func awakeFromNib() {
        super.awakeFromNib()
        let favGesture = UITapGestureRecognizer(target: self, action: #selector(pressedFav))
        imgFav.isUserInteractionEnabled = true
        imgFav.addGestureRecognizer(favGesture)
        tblEpisodes.delegate = self
        tblEpisodes.dataSource = self
    }
    func setupViews() {
        tblEpisodes.isScrollEnabled = false
        cnsTblHeight.constant = CGFloat(character.episode.count * 125)
        if cnsTblHeight.constant >= 31 * 125 {
            cnsTblHeight.constant = 31 * 125 - 3 * 125 - 30
        }
        cnsWholeHeight.constant = CGFloat(290) + cnsTblHeight.constant
        let epNib = UINib(nibName: "EpisodeCell", bundle: nil)
        tblEpisodes.register(epNib, forCellReuseIdentifier: "epCell")
        tblEpisodes.reloadData()
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
        setupViews()
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
        if character.type.isEmpty == true {
            lblType.text = "This character's type is unknown"
        }else{
            lblType.text = "This character's type is \(character.type)"
        }
        if character.gender == "unknown" {
            lblGender.text = "This character's gender is unknown"
        }else{
            lblGender.text = "This character is a \(character.gender)"
        }
        if character.origin.isEmpty == true {
            lblOrigin.text = "This character's origins are unknown"
        }else{
            lblOrigin.text = "This character's origin is \(character.origin)"
        }
        if character.location.isEmpty == true {
            lblLocation.text = "This character's location is unknown"
        }else{
            lblLocation.text = "This character lives in \(character.location)"
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension FavCell:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character.episode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "epCell", for: indexPath) as! EpisodeCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.configure(with: character.episode[indexPath.row])
        return cell 
    }
    
    
}
