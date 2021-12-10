//
//  CourseVC.swift
//  spark
//
//  Created by spark inc on 05/04/1443 AH.
//

import UIKit

class CourseVC: UIViewController {

    @IBOutlet weak var courseTitleLBL: UILabel!
    var courseTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courseTitleLBL.text = courseTitle
    }
    

}
