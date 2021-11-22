//
//  LoginVC.swift
//  spark
//
//  Created by spark inc on 23/03/1443 AH.
//

import UIKit
import PhoneNumberKit


class LoginVC: UIViewController {

    @IBOutlet var waveShapes: [UIImageView]!
    
    @IBOutlet weak var brokenLamp: UIImageView!
    @IBOutlet var planets: [UIImageView]!
    
    @IBOutlet weak var phoneNumberTF: PhoneNumberTextField!
    @IBOutlet weak var phoneNumberStackView: UIStackView!
    
    @IBOutlet weak var verifyCodeTF: UITextField!
    @IBOutlet weak var verificationCodeStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        phoneNumberTF.withFlag = true
        phoneNumberTF.withDefaultPickerUI = true
        phoneNumberTF.withExamplePlaceholder = true
        
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
            self.brokenLamp.frame.origin.y += 8
            self.planets[2].frame.origin.y += 10
            self.planets[1].frame.origin.y += 15
            self.planets[0].frame.origin.y += 25
            for shape in self.waveShapes {
                shape.tintColor = #colorLiteral(red: 0.998763144, green: 0.6134348512, blue: 0, alpha: 1)
                shape.frame.origin.y += [5,10,15].shuffled().first!
            }
        }
    }
    
    @IBAction func didPressSendCodeButton(_ sender: Any) {
        guard let nationalNumber = phoneNumberTF.phoneNumber?.nationalNumber else { return }
        guard let countryCode = phoneNumberTF.phoneNumber?.countryCode else { return }
        let phoneNumber = "+\(countryCode)\(nationalNumber)"
        
        AuthService.instance.verifyPhoneNumber(phoneNumber) { verificationID, error in
            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
            self.verificationCodeStackView.isHidden = false
            UIView.animate(withDuration: 0.5, delay: 0) {
                self.phoneNumberStackView.alpha = 0
                self.verificationCodeStackView.alpha = 1
            } completion: { [self] _ in
                self.phoneNumberStackView.isHidden = true
                
            }

        }
    }
    
    @IBAction func didPressBackButton(_ sender: Any) {
        self.phoneNumberStackView.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.phoneNumberStackView.alpha = 1
            self.verificationCodeStackView.alpha = 0
        } completion: { [self] _ in
            self.verificationCodeStackView.isHidden = true

        }
    }
    
    @IBAction func didPressVerifyButton(_ sender: Any) {
        guard let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") else { return }
        guard let smsCode = verifyCodeTF.text else { return }
        
        AuthService.instance.loginUser(withVerificationID: verificationID, andSmsCode: smsCode) { status,error in
            if status {
                //open homeVC
                print("dismissing***")
                self.dismiss(animated: true, completion: nil)
            } else {
                //present error alert
            }
        }
    }
}

