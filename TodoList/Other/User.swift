//
//  User.swift
//  TodoList
//
//  Created by Tyler Hu on 4/6/26.
//

import Foundation

struct User: Codable {
    let id: String
    let email: String
    let name: String
    let join: TimeInterval
}
