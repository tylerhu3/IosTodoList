//
//  TodoListItemView.swift
//  TodoList
//
//  Created by Tyler Hu on 4/22/26.
//

import SwiftUI

struct TodoListItemView: View {
    @StateObject var viewModel = TodoListItemViewViewModel()
    let item: ToDoListItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    TodoListItemView(
        item: .init(
            id: "123",
            title: "Milk Cow",
            dueDate: Date().timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isDone: false
        )
    )
}
