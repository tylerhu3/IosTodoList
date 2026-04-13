//
//  RegisterView.swift
//  TodoList
//
//  Created by Tyler Hu on 4/5/26.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Start organzing todos", angle: -15, background: .orange)
            Form {
                TextField("Full Name", text: $name )
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $email )
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $password).textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Register", background: Color.green, action: {print("Registed")})
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
