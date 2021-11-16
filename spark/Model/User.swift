//
//  User.swift
//  spark
//
//  Created by spark inc on 11/04/1443 AH.
//

import Foundation

class User {
    private var _username: String
    
    var username: String {
        return _username
    }
    
    init(username: String) {
        _username = username
    }
}
