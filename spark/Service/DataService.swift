//
//  DataService.swift
//  spark
//
//  Created by spark inc on 11/04/1443 AH.
//

import Foundation
import Firebase


let realtimeDB = Database.database().reference()
let storageDB = Storage.storage().reference()


class DataService {
    static let instance = DataService()
    
    
    
    //root and database branches
    private var _refRealtimeDB = realtimeDB
    
    private var _refAppData = realtimeDB.child("appData")
    private var _refMinimumVersion = realtimeDB.child("appData").child("minimumVersion-ios")
    
    private var _refUsers = realtimeDB.child("users")
    private var _refCourses = realtimeDB.child("courses")
    
    
    private var _refStorageDB = storageDB
    private var _refProfileImages = storageDB.child("profile-images")
    
    
    var refRealtimeDB: DatabaseReference { return _refRealtimeDB }
    var refAppData: DatabaseReference { return _refAppData }
    var refMinimumVersion: DatabaseReference { return _refMinimumVersion }
    var refUsers: DatabaseReference { return _refUsers }
    var refCourses: DatabaseReference { return _refCourses }
    
    var refStorageDB: StorageReference { return _refStorageDB }
    var refProfileImages: StorageReference { return _refProfileImages }
    
    
    
    // read and write functions
    
    // this is a write function that updates the user data
    func updateUserData(userData: [String: Any], handler: @escaping ( _ error: Error?) -> () ) {
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        refUsers.child(currentUserUID).updateChildValues(userData) { error, _ in
            handler(error)
        }
    }
    
    func isRegistered(handler: @escaping ( _ state: Bool) -> ()) {
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        refUsers.child(currentUserUID).observeSingleEvent(of: .value) { userDataSnapshot in
            handler(userDataSnapshot.exists())
        }
    }
    
    func getUserCreationDate() -> String? {
        guard let creationDate = Auth.auth().currentUser?.metadata.creationDate else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: creationDate)
    }
    
    
    func getUserData(handler: @escaping ( _ user: User?) -> () ) {
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        refUsers.child(currentUserUID).observe(.value) { userDataSnapshot in
            if let userData = userDataSnapshot.value as? [String: Any] {
                let user = User(uid: currentUserUID, dictionary: userData)
                handler(user)
            }
        }
    }
    
    //course functions
    func postCourse(withValues courseData: [String: Any], handler: @escaping ( _ error: Error?) -> ()) {
        refCourses.childByAutoId().updateChildValues(courseData) { error, _ in
            handler(error)
        }
    }
    
}
