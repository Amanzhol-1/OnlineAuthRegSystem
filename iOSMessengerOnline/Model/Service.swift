//
//  Service.swift
//  iOSMessengerOnline
//
//  Created by Amanzhol on 01.07.2024.
//

import Foundation
import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class Service {
    static let shared = Service()
    
    init() {}
    
    func createNewUser(_ data: LoginField, completion: @escaping (ResponseCode)->()){
        Auth.auth().createUser(withEmail: data.email, password: data.password) { result, err in
            if err == nil {
                if result != nil {
                    let userId = result?.user.uid
                    let email = data.email
                    let data: [String: Any] = ["email": email]
                    Firestore.firestore().collection("users").document(userId!).setData(data)
                    
                    completion(ResponseCode(code: 1))
                }
            } else {
                completion(ResponseCode(code: 0))
            }
        }
    }
    
    func confirmEmail(){
        Auth.auth().currentUser?.sendEmailVerification(completion: { err in
            if err != nil {
                print(err!.localizedDescription)
            }
        })
    }
    
    func authInApp(_ data: LoginField, complection: @escaping (AuthResponce) -> ()){
        Auth.auth().signIn(withEmail: data.email, password: data.password) { result, err in
            if err != nil {
                complection(.error)
            } else {
                if let result = result {
                    if result.user.isEmailVerified {
                        complection(.success)
                    } else {
                        self.confirmEmail()
                        complection(.noVerify)
                    }
                }
            }
        }
    }
    
    func getUserStatus(){
        
    }
    
    func getAllUsers(completion: @escaping ([String]) -> ()){
        Firestore.firestore().collection("users").getDocuments { snap, err in
            if err == nil {
                var emailList = [String]()
                if let docs = snap?.documents {
                    for doc in docs {
                        let data = doc.data()
                        let email = data["email"] as! String
                        emailList.append(email)
                    }
                }
                completion(emailList)
            }
        }
    }
}
