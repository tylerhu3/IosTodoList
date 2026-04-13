//
//  LoginView.swift
//  TodoList
//
//  Created by Tyler Hu on 4/5/26.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationView {
            VStack{
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: -15, background: .orange)
                
                Form {
                    TextField("Email Address", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $password).textFieldStyle(DefaultTextFieldStyle())
                }
                Spacer()
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
    
}

#Preview {
    LoginView()
}
