//
//  TLButton.swift
//  TodoList
//
//  Created by Tyler Hu on 4/5/26.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
            .frame(height: 50)
        } 
    }
}

#Preview {
    TLButton(
        title: "String", background: Color.blue) {
            print("Test")
        }
}
