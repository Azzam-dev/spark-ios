//
//  NavigationVC.swift
//  spark
//
//  Created by spark inc on 25/03/1443 AH.
//

import UIKit

class NavigationVC: UIViewController {
   
    var homeSubNAV: UINavigationController!
    var exploreSubNAV: UINavigationController!
    var postSubNAV: UINavigationController!
    var favouritesSubNAV: UINavigationController!
    var myProfileSubNAV: UINavigationController!

    var navigationControllers: [UINavigationController]!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var yellowViewLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet var navigationButtonViews: [UIView]!
    @IBOutlet var navigationButtonImages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubNavigationControllers()
        // Do any additional setup after loading the view.
    }
    
    func setupSubNavigationControllers() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeSubNAV = storyboard.instantiateViewController(withIdentifier: "homeNAV") as? UINavigationController
        exploreSubNAV = storyboard.instantiateViewController(withIdentifier: "exploreNAV") as? UINavigationController
        postSubNAV = storyboard.instantiateViewController(withIdentifier: "postNAV") as? UINavigationController
        favouritesSubNAV = storyboard.instantiateViewController(withIdentifier: "favouritesNAV") as? UINavigationController
        myProfileSubNAV = storyboard.instantiateViewController(withIdentifier: "myProfileNAV") as? UINavigationController
        navigationControllers = [homeSubNAV, exploreSubNAV, postSubNAV, favouritesSubNAV, myProfileSubNAV]
        
        
        addChild(homeSubNAV)
        homeSubNAV.view.frame = contentView.bounds
        contentView.addSubview(homeSubNAV.view)
        homeSubNAV.didMove(toParent: self)
    }
    
    var previousIndex = 0
    @IBAction func didPressNavButton(_ sender: UIButton) {
        
        
        let previousVC = navigationControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        let selectedVC = navigationControllers[sender.tag]
        addChild(selectedVC)
        selectedVC.view.frame = contentView.bounds
        contentView.addSubview(selectedVC.view)
        selectedVC.didMove(toParent: self)
        
        navigationButtonImages[previousIndex].tintColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        navigationButtonImages[sender.tag].tintColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseIn) {
            self.yellowViewLeadingConstraint.constant = self.navigationButtonViews[sender.tag].frame.minX
            self.view.layoutIfNeeded()
        }
        previousIndex = sender.tag
        
    }
    
}
