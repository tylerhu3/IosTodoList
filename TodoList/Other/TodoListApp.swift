//
//  TodoListApp.swift
//  TodoList
//
//  Created by Tyler Hu on 4/4/26.
//

import SwiftUI
import FirebaseCore

@main
struct TodoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
