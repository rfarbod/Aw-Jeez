//
//  JResponse.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation

import Arrow

struct JResponse: ArrowParsable {
    
    var message             :String? = nil
    var code                : ResponseCodes = .success
    var results:             ArrowParsable?  = nil
    
    init() {}
    
    init(_ resultType: ArrowParsable.Type?) {
        self.results = resultType?.init()
    }
    
    mutating func deserialize(_ json: JSON) {
      
            results?.deserialize(json)
        

    }
    
    mutating func parse(_ dictionary: Any?) {
        if let json = JSON(dictionary as? NSDictionary) {
            print(json)
            deserialize(json)
        } else {
            self = JResponse.noResponse
        }
    }
    
    static var notConnected: JResponse {
        get {
            var response = JResponse()
            response.code = .app_noConnection
            response.message = "Problem Connecting to Internet"
            return response
        }
    }
    
    static var noResponse: JResponse {
        get {
            var response = JResponse()
            response.code = .app_serverDown
            response.message = "Problem Connecting to Server"
            return response
        }
    }
    enum ResponseCodes: Int {
        
        case app_noConnection       = -1
        case app_serverDown         = -2
        case success                = 0
        case err_Unknown            = 1000
    }

    
}
