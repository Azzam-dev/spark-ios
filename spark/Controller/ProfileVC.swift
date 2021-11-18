//
//  ProfileVC.swift
//  spark
//
//  Created by spark inc on 04/04/1443 AH.
//

import UIKit

class ProfileVC: UIViewController {
    
    let myCoursesArray = [
        
        Course(key: "1", title: "firebase 101", logoURL: "", price: .free, date: "Wednesday, 10 November 2021", time: "4:00 PM - 8:00 PM"),
        Course(key: "2", title: "Swift 101", logoURL: "", price: .free, date: "Wednesday, 11 November 2021", time: "4:00 PM - 8:00 PM"),
        Course(key: "3", title: "Kotlin 101", logoURL: "", price: .free, date: "Wednesday, 12 November 2021", time: "4:00 PM - 8:00 PM")
    
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var planets: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset.top = 60
        tableView.contentInset.bottom = 60
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        planets[2].frame.origin.y = 120
        planets[1].frame.origin.y = -20
        planets[0].frame.origin.y = -80
        UIView.animate(withDuration: 3, delay: 0, options: [.repeat,.autoreverse]) {
            self.planets[2].frame.origin.y += 10
            self.planets[1].frame.origin.y += 15
            self.planets[0].frame.origin.y += 25
        }
    }
    

    
    func logoutAlert() {
        let logoutPopup = UIAlertController(title: "تسجيل الخروج", message: "هل تريد تسجيل الخروج ؟", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "نعم", style: .destructive ) { (buttonTapped) in
            AuthService.instance.logoutUser { status in
                if status {
                    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                    let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC")
                    loginVC.modalPresentationStyle = .fullScreen
                    self.present(loginVC, animated: true, completion: nil)
                } else {
                    //something went wrong
                }
            }
        }
        let cancel = UIAlertAction(title: "لا", style: .cancel, handler: nil)
        logoutPopup.addAction(logoutAction)
        logoutPopup.addAction(cancel)
        
        
        if let popoverController = logoutPopup.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        self.present(logoutPopup, animated: true , completion: nil)
        
    }
    @IBAction func didPressMoreButton(_ sender: Any) {
        logoutAlert()
    }
    
    
    
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCoursesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else { return UITableViewCell() }
        cell.configure(course: myCoursesArray[indexPath.row])
        return cell
    }
    
    
}
