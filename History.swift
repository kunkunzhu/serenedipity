//
//  History.swift
//  serenedipity-0
//
//  Created by Kun Zhu on 2024-06-29.
//

import SwiftUI

// list, grid, calendar

struct History: View {
    
    @ObservedObject var momentData: MomentData
    
    let backgroundGradient = LinearGradient(
        colors: [Color.indigo, Color.black],
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            MomentList(momentData: MomentData())
        }
    }
}

#Preview {
    History(momentData: MomentData())
}
