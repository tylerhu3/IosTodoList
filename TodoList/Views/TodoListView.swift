//
//  TodoListView.swift
//  TodoList
//
//  Created by Tyler Hu on 4/14/26.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel = ToDoListViewModel()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // Action
                    viewModel.showNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }.sheet(isPresented: $viewModel.showNewItemView){
                NewItemView()
            }
        }
    }
}

#Preview {
    TodoListView(userId:  "Tyler")
}
