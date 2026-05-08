//
//  ToDoListItem.swift
//  TodoList
//
//  Created by Tyler Hu on 4/21/26.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    var title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
