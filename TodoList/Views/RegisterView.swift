//
//  RegisterView.swift
//  TodoList
//
//  Created by Tyler Hu on 4/5/26.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Start organzing todos", angle: -15, background: .orange)
            Form {
                TextField("Full Name", text: $viewModel.name )
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email )
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Register", background: Color.green, action: {
                
                        print("Registed")
                    viewModel.register()
                        
                })
                    .padding()
            }
            .offset(y: -50)
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
