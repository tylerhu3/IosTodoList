//
//  NewItemView.swift
//  TodoList
//
//  Created by Tyler Hu on 4/15/26.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            Form {
                // Title Field for TODO
                TextField("Title",
                          text: $viewModel.title)
                .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                
                TLButton(title: "Save",
                         background: .pink,
                    action: {
                    viewModel.title.isEmpty ?
                    print("Title cannot be empty") :
                    viewModel.title.append("\n")
                }).padding()
            }
        }
    }
}

#Preview {
    NewItemView()
}
