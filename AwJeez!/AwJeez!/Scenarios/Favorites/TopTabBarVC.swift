//
//  TopTabBarVC.swift
//  AwJeez!
//
//  Created by Farbod on 4/30/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import UIKit
import SwipeMenuViewController
class TopTabBarVC: SwipeMenuViewController {
    var array = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        let charVC = Storyboards.Main.charVC
        let favVC = Storyboards.Main.favVC
        charVC.title = "CHARACTERS"
        favVC.title = "FAVORITES"
        array.append(contentsOf: [charVC,favVC])
        swipeMenuView.options.tabView.style = .segmented
        swipeMenuView.options.tabView.backgroundColor = UIColor(red: 222/255, green: 103/255, blue: 20/255, alpha: 1)
        swipeMenuView.options.tabView.itemView.selectedTextColor = .white
        swipeMenuView.options.tabView.additionView.backgroundColor = UIColor.white
        swipeMenuView.reloadData()
    }
    func setupNavigation() {
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return array[index].title!
    }
    override func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
           return array.count
    }
   override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
           return array[index]
      }
    
  

}

