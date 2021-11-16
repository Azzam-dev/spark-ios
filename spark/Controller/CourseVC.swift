//
//  CourseVC.swift
//  spark
//
//  Created by spark inc on 05/04/1443 AH.
//

import UIKit

class CourseVC: UIViewController {

    @IBOutlet weak var courseTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        courseTitle.text = "Swift 101"
    }
    

}
