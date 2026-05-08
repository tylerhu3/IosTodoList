//
//  TodoListView.swift
//  TodoList
//
//  Created by Tyler Hu on 4/14/26.
//

import SwiftUI
import FirebaseFirestore

struct TodoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userId: String
    
    init(userId: String) {
        // DB directory
        //users/<userId>/todos/<entries>
        self.userId = userId
        self._items = FirestoreQuery (
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView { // Adds the ability to add little icons on the bottom for screen nav
            VStack {
                List(items , id: \.id) { item in
                    TodoListItemView(item: item)
                        .swipeActions{
                            Button("Delete") {
                                // Delete
                                viewModel.delete(id: item.id)
                            }.tint(.red)
                        }
                }.listStyle(PlainListStyle())
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
