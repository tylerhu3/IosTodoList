//
//  NewItemViewModel.swift
//  TodoList
//
//  Created by Tyler Hu on 4/15/26.
//

import Foundation
class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    
    init() {
    
    }
}
