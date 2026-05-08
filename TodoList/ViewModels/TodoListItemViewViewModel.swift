//
//  TodoListItemViewViewModel.swift
//  TodoList
//
//  Created by Tyler Hu on 5/5/26.
//
import FirebaseFirestore
import FirebaseAuth


import Foundation

// ViewModel for a single todo list view item
class TodoListItemViewViewModel: ObservableObject {
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            print("Invalid uid toggleIsDone")
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary()){ error in
                if let error = error {
                    // Failure: Log the error message
                    print("DEBUG: Failed to update item : \(error.localizedDescription)")
                } else {
                    // Success: Confirm the item was saved
                    print("DEBUG: Successfully saved item")
                }
            }
    }
}
