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
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var isLoading = false // Track loading state

    func login() {
        guard validate() else { return }
        
        isLoading = true
        errorMessage = ""
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let error = error {
                    // This will catch "Wrong Password", "User Not Found", etc.
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func validate() -> Bool {
        errorMessage = ""
        if email.trimmingCharacters(in: .whitespaces).isEmpty ||
           password.trimmingCharacters(in: .whitespaces).isEmpty {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        if !email.contains("@") || !email.contains(".") {
            errorMessage = "Please enter a valid email."
            return false
        }
        return true
    }
}
