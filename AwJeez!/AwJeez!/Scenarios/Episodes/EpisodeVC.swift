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
    @IBOutlet weak var tbEpisodes: UITableView!
    var episodes = [JEpisode]()
    var character = JCharacter()
    var cellStates = [Int:EpisodeState]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    func setupViews() {
        let nib = UINib(nibName: "Character", bundle: nil)
        tbEpisodes.register(nib, forCellReuseIdentifier: "characterCell")
        let epNib = UINib(nibName: "EpisodeCell", bundle: nil)
        tbEpisodes.register(epNib, forCellReuseIdentifier: "epCell")
        for i in 0...character.episode.count - 1 {
            cellStates.updateValue(.normal, forKey: i)
        }
        tbEpisodes.reloadData()
    }
    @IBAction func pressedBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
            if let cellState = cellStates[indexPath.row] {
                cell.configure(with: character.episode[indexPath.row], delegate: self, state: cellState, needsDetaildInfo: true)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }

}
extension EpisodeVC:EpisodeDelegate {
    func pressedEpisode(epName: String,state: EpisodeState) {
         tbEpisodes.beginUpdates()
         tbEpisodes.endUpdates()
        if let index = character.episode.firstIndex(of: epName) {
            cellStates.updateValue(state, forKey: Int(index))
        }
         

    }
    
    
}
