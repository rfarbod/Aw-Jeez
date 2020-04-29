//
//  WebServices.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation
import ReachabilitySwift
import Alamofire
import Arrow

struct WebServices {
    internal typealias Success              = (_ response: JResponse) -> ()
    internal typealias Failure              = (_ response: JResponse) -> ()
    
    static func isConnected(failure: Failure? = nil) -> Bool {
        // checking connection
        if (Reachability.init()!.connection == .none) {
            failure?(JResponse.notConnected)
            return false
        }
        return true
    }
    
    static func request(url: String,
                        method: HTTPMethod = .get,
                        params: [String: Any] = [:],
                        resultType: ArrowParsable.Type? = nil,
                        success: Success?, failure: Failure?, retriesLeft: Int = 0) {
        
        // response function
        func responseJSON(response: DataResponse<Any>){
            var jResponse = JResponse(resultType.self)
            jResponse.parse(response.result.value)
            print(jResponse)
           success?(jResponse)
            
        }
        
        
        print("URL: \(url)")
        print("params: \(params)")
        Alamofire.request(url, method: method , encoding: JSONEncoding.default, headers: [:])
                       .responseJSON { response in
                           responseJSON(response: response)
        
    }
    }
    
    
    static func cancelRequests(_ url: String) {
        Alamofire.SessionManager.default.session.getTasksWithCompletionHandler
            {
                (dataTasks, uploadTasks, downloadTasks) -> Void in
                
                Alamofire.SessionManager.cancelTasksByUrl(dataTasks     as [URLSessionTask], url: url)
                Alamofire.SessionManager.cancelTasksByUrl(uploadTasks   as [URLSessionTask], url: url)
                Alamofire.SessionManager.cancelTasksByUrl(downloadTasks as [URLSessionTask], url: url)
        }
    }
    
}

extension Alamofire.SessionManager
{
    // cancel tasks by url
    fileprivate static func cancelTasksByUrl(_ tasks: [URLSessionTask], url: String)
    {
        for task in tasks
        {
            let hasPrefix = task.currentRequest?.url?.description.hasPrefix(url)
            if hasPrefix != nil && hasPrefix! == true
            {
                task.cancel()
            }
        }
    }
}
