//
//  ProfileTableViewCell.swift
//  spark
//
//  Created by spark inc on 04/04/1443 AH.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var logo: DesignableImage!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    func configure(course: Course) {
        title.text = course.title
        price.text = String(course.price.rawValue)
//        if let imageURL = URL(string: course.imageURL ?? "" ) {
//            self.logo.af.setImage(withURL: imageURL)
//        }
        date.text = course.date
    }
}
