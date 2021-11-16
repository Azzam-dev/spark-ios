//
//  Receipt.swift
//  spark
//
//  Created by spark inc on 11/04/1443 AH.
//

import Foundation

enum ReceiptState {
    case paid
}

struct Receipt {
    var course: Course
    var state: ReceiptState
}
