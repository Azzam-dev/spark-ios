//
//  ExploreVC.swift
//  spark
//
//  Created by spark inc on 04/04/1443 AH.
//

import UIKit

class ExploreVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.contentInset.bottom = 100
    }
    
    @IBOutlet weak var expandableViewTopConstraint: NSLayoutConstraint!
    
    @IBAction func didPerformPanGesture(_ sender: UIPanGestureRecognizer) {
        view.layoutIfNeeded()
        expandableViewTopConstraint.constant = sender.location(in: view).y
        if sender.state == .ended {
            if expandableViewTopConstraint.constant <= 150 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseOut) {
                    
                    self.expandableViewTopConstraint.constant = 150
                    self.view.layoutIfNeeded()
                }
            } else if expandableViewTopConstraint.constant <= view.frame.height / 1.5 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseOut) {
                    
                    self.expandableViewTopConstraint.constant = self.view.frame.height / 2.5
                    self.view.layoutIfNeeded()
                }
            } else {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseOut) {
                    
                    self.expandableViewTopConstraint.constant = self.view.frame.height - 200
                    self.view.layoutIfNeeded()
                }
            }
        }
        
        print(sender.location(in: view).y)
        
        
    }
    
}


extension ExploreVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
