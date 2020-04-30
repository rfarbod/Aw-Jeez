//
//  EventsHelper.swift
//  AwJeez!
//
//  Created by Farbod on 4/30/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation
import UIKit
class EventsHelper {

    static let shared = EventsHelper()
    private init() {
        
    }
    static func setup() {
        _ = shared
    }
    //tapped Favorite icon
    private static let FavoritesUpdated = Notification.Name("FavoritesUpdated")
    static func favoriteUpdated(_ id:Int , favoriteState:Bool) {
        let userInfo = ["id":id,"state":favoriteState] as [String : Any]
        NotificationCenter.default.post(name: FavoritesUpdated, object: nil, userInfo: userInfo)
    }
    static func observeFavorites(_ cell:UITableViewCell,with callback:Selector) {
        NotificationCenter.default.addObserver(cell, selector: callback, name: FavoritesUpdated, object: nil)
    }
    static func observeFavorites(_ vc:UIViewController, with callback:Selector) {
        NotificationCenter.default.addObserver(vc, selector: callback, name: FavoritesUpdated, object: nil)
    }
    
}
