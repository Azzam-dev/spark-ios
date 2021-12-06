//
//  User.swift
//  spark
//
//  Created by spark inc on 11/04/1443 AH.
//

import Foundation

class User {
    private var _uid: String
    private var _username: String
    
    var uid: String {
        return _uid
    }
    
    var username: String {
        return _username
    }
    
    init(uid: String ,dictionary: [String: Any]) {
        _uid = uid
        _username = dictionary["username"] as? String ?? ""
        
    }
}
