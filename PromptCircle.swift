//
//  File.swift
//  serenedipity-0
//
//  Created by Kun Zhu on 2024-06-29.
//

import SwiftUI


struct PromptCircle: View {
    
    let clearGradient = LinearGradient(
        gradient: Gradient(colors: [.white, .clear]),
        startPoint: .topTrailing,
        endPoint: .bottomLeading)
    
    var body: some View {
        ZStack {
            Image(systemName: "plus")
                .font(.system(size: 40, weight: .ultraLight))
                .foregroundColor(.white)
            clearGradient
                .opacity(0.2)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 1)
                }
                .shadow(color: .white, radius: 7)
        }
    }
}


#Preview {
    Home()
}
