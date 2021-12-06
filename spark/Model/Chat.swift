//
//  Chat.swift
//  spark
//
//  Created by spark inc on 11/04/1443 AH.
//

import Foundation


class Chat {
    private var _name: String
    private var _messages: [Message]
    
    var name : String {
        return _name
    }
    
    var messages: [Message] {
        return _messages
    }
    
    init(name: String, messages: [Message]) {
        _name = name
        _messages = messages
        
    }
    
}
