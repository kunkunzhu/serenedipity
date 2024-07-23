//
//  Profile.swift
//  serenedipity-0
//
//  Created by Kun Zhu on 2024-06-29.
//

import SwiftUI

struct Profile: View {
    let backgroundGradient = LinearGradient(
        colors: [Color.indigo, Color.black],
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            VStack {
                Image(systemName: "person")
                    .imageScale(.large)
                    .foregroundColor(.white)
                    .padding()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("profile")
                    .colorInvert()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    Profile()
}
