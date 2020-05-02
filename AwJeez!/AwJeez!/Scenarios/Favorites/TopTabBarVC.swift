//
//  TopTabBarVC.swift
//  AwJeez!
//
//  Created by Farbod on 4/30/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import UIKit
import SwipeMenuViewController
class TopTabBarVC: UIViewController {
    @IBOutlet weak var swipeMenuView: SwipeMenuView!
    var array = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupNavbar()
    }
    func setupNavbar() {
        swipeMenuView.delegate = self
        swipeMenuView.dataSource = self
        let charVC = Storyboards.Main.charVC
             let favVC = Storyboards.Main.favVC
             charVC.title = "CHARACTERS"
             favVC.title = "FAVORITES"
             charVC.delegate = self
              favVC.delegate = self
             array.append(contentsOf: [charVC,favVC])
             var options:SwipeMenuViewOptions = .init()
             options.tabView.style = .segmented
             options.tabView.backgroundColor = UIColor(red: 222/255, green: 103/255, blue: 20/255, alpha: 1)
             options.tabView.itemView.selectedTextColor = .white
             options.tabView.additionView.backgroundColor = UIColor.white
             swipeMenuView.reloadData(options: options, isOrientationChange: false)
    }
    func setupNavigation() {
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
   
}
extension TopTabBarVC:SwipeMenuViewDataSource,SwipeMenuViewDelegate {
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
           return array[index].title!
       }
        func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
              return array.count
       }
      func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
              return array[index]
         }
}
extension TopTabBarVC:CharacterDelegate {
    func pressedChar(character: JCharacter) {
        let epVC = Storyboards.Main.epVC
        epVC.character = character
        navigationController?.pushViewController(epVC, animated: true)
    }
}
extension TopTabBarVC:FavoritesDelegate {
    func pressedFav(character: JCharacter) {
         let epVC = Storyboards.Main.epVC
        epVC.character = character
        navigationController?.pushViewController(epVC, animated: true)
    }
}

