//
//  LoginViewViewModel.swift
//  TodoList
//
//  Created by Tyler Hu on 4/5/26.
//

import Foundation
import FirebaseAuth
internal import Combine

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, link: password)
    }
    
    func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Email and password are required"
            return false
        }
              
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Valid email required"
            return false
        }

        return true
    }
}
