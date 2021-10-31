//
//  NavigationVC.swift
//  spark
//
//  Created by spark inc on 25/03/1443 AH.
//

import UIKit

class NavigationVC: UIViewController {
   
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var yellowViewLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet var navigationButtonViews: [UIView]!
    @IBOutlet var navigationButtonImages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var previousIndex = 0
    @IBAction func didPressNavButton(_ sender: UIButton) {
        navigationButtonImages[previousIndex].tintColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        navigationButtonImages[sender.tag].tintColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseIn) {
            self.yellowViewLeadingConstraint.constant = self.navigationButtonViews[sender.tag].frame.minX
            self.view.layoutIfNeeded()
        }
        previousIndex = sender.tag
        
    }
    
}
