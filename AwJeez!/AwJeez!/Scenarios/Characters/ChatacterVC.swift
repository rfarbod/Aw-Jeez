//
//  ViewController.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import UIKit

class CharacterVC: UIViewController {

    @IBOutlet weak var tblCharacters: UITableView!
    lazy var viewModel = CharacterVM(self)
    var characters = [JCharacter]()
    var selectedCharacter = JCharacter()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getCharacters()
    }
    func updateViews() {
        tblCharacters.reloadData()
    }
    func setupViews() {
        let nib = UINib(nibName: "Character", bundle: nil)
        tblCharacters.register(nib, forCellReuseIdentifier: "characterCell")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCharacterEpisodes" {
            if let vc = segue.destination as? EpisodeVC {
                vc.character = selectedCharacter
            }
        }
    }


}
extension CharacterVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! CharacterCell
        cell.configure(with: characters[indexPath.row])
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCharacter = characters[indexPath.row]
        self.performSegue(withIdentifier: "showCharacterEpisodes", sender: self)
    }
    
}

