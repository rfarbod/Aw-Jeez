//
//  EpisodeVCViewController.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import UIKit
import Hero
class EpisodeVC: UIViewController {
    @IBOutlet weak var imgBack: UIImageView!
    @IBOutlet weak var tbEpisodes: UITableView!
    var episodes = [JEpisode]()
    var character = JCharacter()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    func setupViews() {
        self.hero.isEnabled = true
        tbEpisodes.heroID = "rickExpanded"
        self.view.hero.modifiers = [.translate(y:100)]
        let nib = UINib(nibName: "Character", bundle: nil)
        tbEpisodes.register(nib, forCellReuseIdentifier: "characterCell")
        tbEpisodes.reloadData()
    }
    @IBAction func pressedBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    

}
extension EpisodeVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return character.episode.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! CharacterCell
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.configure(with: character)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "epCell", for: indexPath) as! EpisodeCell
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            cell.configure(with: character.episode[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
}
