//
//  NewItemViewModel.swift
//  TodoList
//
//  Created by Tyler Hu on 4/15/26.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {
    
    }
    
    func save() {
        guard canSave else {
            print("NewItemViewModel -- save -- Cannot save item ")
            return
        }
        
        // Get ID from Firebase
        guard let uId = Auth.auth().currentUser?.uid else {
            print("NewItemViewModel -- save -- Cannot save item  -- Fail to get user ID")
                return
        }
        
        // Create model for saving
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id:newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary()) { error in
                if let error = error {
                    // Failure: Log the error message
                    print("DEBUG: Failed to save item \(newId) with error: \(error.localizedDescription)")
                } else {
                    // Success: Confirm the item was saved
                    print("DEBUG: Successfully saved item \(newId) for user \(uId)")
                }
            }
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
