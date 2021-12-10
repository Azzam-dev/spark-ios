//
//  RegistrationVC.swift
//  spark
//
//  Created by spark inc on 02/05/1443 AH.
//

import UIKit

class RegistrationVC: UIViewController {

    @IBOutlet var waveShapes: [UIImageView]!
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var birthDate: UIDatePicker!
    @IBOutlet weak var userType: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        waveShapesAnimation()
    }
    
    func waveShapesAnimation() {
        waveShapes[0].tintColor = #colorLiteral(red: 1, green: 0.6761596203, blue: 0, alpha: 1)
        waveShapes[1].tintColor = #colorLiteral(red: 1, green: 0.6761596203, blue: 0, alpha: 1)
        waveShapes[2].tintColor = #colorLiteral(red: 1, green: 0.6593478322, blue: 0, alpha: 1)
        waveShapes[3].tintColor = #colorLiteral(red: 1, green: 0.6593478322, blue: 0, alpha: 1)
        UIView.animate(withDuration: 3, delay: 0, options: [.repeat,.autoreverse]) {
            for shape in self.waveShapes {
                shape.tintColor = #colorLiteral(red: 0.998763144, green: 0.6134348512, blue: 0, alpha: 1)
                shape.frame.origin.y += [5,10,15].shuffled().first!
            }
        }
    }
    
    @IBAction func didPressJoinUs(_ sender: Any) {
        if usernameTF.text == "" {
            
        } else {
            if userType.selectedSegmentIndex == -1 {
                
            } else {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let formattedDate = dateFormatter.string(from: birthDate.date)

                let userData: [String : Any] = [
                    "username": usernameTF.text!,
                    "birthDate": formattedDate,
                    "type": userType.selectedSegmentIndex
                ]
                
                DataService.instance.updateUserData(userData: userData) { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                        let navigationVC = storyboard.instantiateViewController(withIdentifier: "NavigationVC")
                        self.present(navigationVC, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
}
