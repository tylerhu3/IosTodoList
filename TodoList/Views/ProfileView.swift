//
//  ProfileView.swift
//  TodoList
//
//  Created by Tyler Hu on 4/14/26.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
              if let user = viewModel.user {
                  profileBody(user: user)
              } else {
                  Text("Loading...")
              }
            }
        }.navigationTitle("Profile") // Added a title for bette
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    // Adding @ViewBuilder allows multiple views to be returned
        @ViewBuilder
    func profileBody(user: User) -> some View {
            // Avatar
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .frame(width: 125, height: 125)
                .padding()
            
            // Info: Name, Email, Member Since
            VStack(alignment: .leading) {
                HStack {
                    Text("Name: ").bold()
                    Text(user.name)
                }
                .padding(.bottom, 5) // Adjusted padding for better spacing
                
                HStack {
                    Text("Email: ").bold()
                    Text(user.email)
                }
                .padding(.bottom, 5)
                
                HStack {
                    Text("Member Since: ").bold()
                    Text("\((Date(timeIntervalSince1970: user.join).formatted(date: .abbreviated, time: .shortened)))")
                }
            }
            .padding()
            
            // Sign Out
            Button("Log Out") {
                viewModel.logOut()
            }
            .tint(.red)
            .padding()
            
            Spacer()
        }
}

#Preview {
    ProfileView()
}
