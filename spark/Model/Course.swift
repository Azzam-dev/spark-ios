//
//  Course.swift
//  spark
//
//  Created by spark inc on 05/04/1443 AH.
//

import Foundation

enum CoursePriceType: Int {
    case free = 0
    case coffee = 30
    case price = 100
}

class Course {
    private var _key: String
    private var _title: String
    private var _logoURL: String
    private var _price: CoursePriceType
    private var _date: String
    private var _time: String
    
    var key: String {
        return _key
    }
    
    var title: String {
        return _title
    }
    
    var logoURL: String {
        return _logoURL
    }
    
    var price: CoursePriceType {
        return _price
    }
    
    var date: String {
        return _date
    }
    
    var time: String {
        return _time
    }
    
    init(key: String, title: String, logoURL: String, price: CoursePriceType, date: String, time: String) {
        _key = key
        _title = title
        _logoURL = logoURL
        _price = price
        _date = date
        _time = time
    }
}
