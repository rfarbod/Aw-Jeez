//
//  CharacterModel.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation
class CharacterModel {
    init(id:Int) {
        self.id = id
    }
    private var _id:Int?
    var id:Int? {
        get{return _id}
        set(new){_id = new}
    }
    private var _name:String?
    var name:String? {
        get{return _name}
        set(new){_name = new}
    }
    private var _status:String?
    var status:String?{
        get{return _status}
        set(new){_status = new}
    }
    private var _type:String?
    var type:String? {
        get{return _type}
        set(new){_type = new}
    }
    private var _species:String?
    var species:String?{
        get{return _species}
        set(new){_species = new}
    }
    private var _gender:String?
    var gender:String? {
        get{return _gender}
        set(new){_gender = new}
    }
    private var _origin:OriginModel?
    var origin:OriginModel? {
        get{return _origin}
        set(new){_origin = new}
    }
    private var _location:LocationModel?
    var location:LocationModel? {
        get {return _location}
        set(new){_location = new}
    }
    private var _image:String?
    var image:String? {
        get{return _image}
        set(new){_image = new}
    }
    private var _episode:[String]?
    var episode:[String]?{
        get{return _episode}
        set(new){_episode = new}
    }
    private var _url:String?
    var url:String?{
        get{return _url}
        set(new){_url = new}
    }
    private var _created:String?
    var created:String?{
        get{return _created}
        set(new){_created = new}
    }
}
