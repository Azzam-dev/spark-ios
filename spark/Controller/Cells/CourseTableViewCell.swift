//
//  CourseTableViewCell.swift
//  spark
//
//  Created by spark inc on 05/04/1443 AH.
//

import UIKit

class CourseTableViewCell: ProfileTableViewCell {
    
    @IBOutlet weak var time: UILabel!
    
    override func configure(course: Course) {
        super.configure(course: course)
        time.text = course.time
    }
}
