//
//  ViewController.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import UIKit
import Hero
class CharacterVC: UIViewController {

    @IBOutlet weak var tblCharacters: UITableView!
    lazy var viewModel = CharacterVM(self)
    var characters = [JCharacter]()
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
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        navigationController?.setNavigationBarHidden(true, animated: true)
        tblCharacters.heroID = "rickExpanded"
        let nib = UINib(nibName: "Character", bundle: nil)
        tblCharacters.register(nib, forCellReuseIdentifier: "characterCell")
    
    }
   
}
extension CharacterVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 125
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
          let logoView = Bundle.main.loadNibNamed("LogoView", owner: self, options: nil)! [0] as! UIView
        logoView.backgroundColor = UIColor.clear
       return logoView
    }
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
        tblCharacters.scrollToRow(at: indexPath, at: .middle, animated: true)
        let epVC = Storyboards.Main.epVC
        epVC.character = characters[indexPath.row]
        navigationController?.pushViewController(epVC, animated: true)
    }

    
}

