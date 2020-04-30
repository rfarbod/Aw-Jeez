//
//  FavoritesVC.swift
//  AwJeez!
//
//  Created by Farbod on 4/30/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import UIKit
class FavoritesVC: UIViewController {
    @IBOutlet weak var tblFav: UITableView!
    var favorites = [RFavCharacter]()
    lazy var favVM = FavoritesVM(self)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        favVM.fetchFavorites()
        EventsHelper.observeFavorites(self, with: #selector(favoritesUpdates(notification:)))
        // Do any additional setup after loading the view.
    }
    @objc func favoritesUpdates(notification:Notification) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.favorites.removeAll()
            self.favVM.fetchFavorites()
            self.tblFav.reloadData()
        }
    }
    func setupViews() {
        tblFav.estimatedRowHeight = 400
        tblFav.rowHeight = UITableView.automaticDimension
        let nib = UINib(nibName: "FavCell", bundle: nil)
        tblFav.register(nib, forCellReuseIdentifier: "favCell")
    }
  
}
extension FavoritesVC:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 125
       }
       func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
             let logoView = Bundle.main.loadNibNamed("LogoView", owner: self, options: nil)! [0] as! UIView
           logoView.backgroundColor = UIColor.clear
          return logoView
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! FavCell
        let jCharacter = favVM.convertToJChar(character: favorites[indexPath.row])
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.configure(with: jCharacter)
        return cell 
    }
    
    
}

    
    

