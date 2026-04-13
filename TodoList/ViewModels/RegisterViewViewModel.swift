//
//  RegisterViewViewModel.swift
//  TodoList
//
//  Created by Tyler Hu on 4/6/26.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
internal import Combine


class RegisterViewViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String? = nil
    
    func register() {
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
            
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           email: email,
                           name: name,
                           join: Date().timeIntervalSince1970
                        )
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "All fields are required."
            return false
        }
        
        guard email.contains("@") && email.contains(".com") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
