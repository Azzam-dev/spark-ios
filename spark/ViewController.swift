//
//  ViewController.swift
//  spark
//
//  Created by spark inc on 23/03/1443 AH.
//

import UIKit
import PhoneNumberKit


class ViewController: UIViewController {

    @IBOutlet var waveShapes: [UIImageView]!
    
    @IBOutlet weak var phoneNumberTF: PhoneNumberTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTF.withFlag = true
        phoneNumberTF.withDefaultPickerUI = true
        phoneNumberTF.withExamplePlaceholder = true
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


}

