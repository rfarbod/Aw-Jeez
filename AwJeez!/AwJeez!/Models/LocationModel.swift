//
//  LocationModel.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.

import Foundation
class LocationModel {
    init(name:String,url:String) {
        
    }
    private var _name:String?
    var name:String?{
        get{return _name}
        set(new){_name = new}
    }
    private var _url:String?
    var url:String?{
        get{return _url}
        set(new){_url = new}
    }
}
