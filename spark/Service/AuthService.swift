//
//  AuthService.swift
//  spark
//
//  Created by spark inc on 11/04/1443 AH.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func verifyPhoneNumber(_ phone: String, completion: @escaping (_ verificationID: String? , _ error: Error?) -> ()) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phone, uiDelegate: nil) { verificationID, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error)
            } else {
                completion(verificationID, nil)
            }
            
        }
    }
    
    func loginUser(withVerificationID verificationID: String, andSmsCode smsCode: String, completion: @escaping (_ status: Bool , _ error: Error?) -> ()) {
        let credential = PhoneAuthProvider.provider().credential(
          withVerificationID: verificationID,
          verificationCode: smsCode
        )
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
        
        
    }
    
    // use this function to logout the user
    func logoutUser(completion: (_ status: Bool) -> () ) {
        do {
            try Auth.auth().signOut()
            
            completion(true)
        } catch {
            completion(false)
        }
    }
    
    
    // use this function to get the user authentication status
    // true if the user is loged-in and false if he is not loged-in
    func checkCurrentUserStatus() -> Bool {
        if Auth.auth().currentUser == nil {
            return false
        } else {
            return true
        }
    }
    
}
