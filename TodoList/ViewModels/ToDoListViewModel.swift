//
//  ToDoListViewModel.swift
//  TodoList
//
//  Created by Tyler Hu on 4/14/26.
//

import Foundation
import FirebaseFirestore

class ToDoListViewModel: ObservableObject {
    
    @Published var showNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete { error in
                if let error = error {
                    print("DEBUG: Error removing document: \(error.localizedDescription)")
                } else {
                    print("DEBUG: Document successfully removed!")
                }
            }
    }
}
