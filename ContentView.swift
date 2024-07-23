//
//  ContentView.swift
//  serenedipity-0
//
//  Created by Kun Zhu on 2024-06-30.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 2
    @StateObject private var momentData = MomentData()
    
//    init() {
//        UITabBar.appearance().backgroundColor = UIColor(white: 1, alpha: 0.5)
//    }

    var body: some View {
        
        TabView (selection:$selection) {
            History(momentData: momentData)
                .tabItem {
                    Label("repository",
                          systemImage: "clock")
                }.tag(1)
            Home()
                .tabItem {
                    Label("home",
                          systemImage: "sparkle")
                }.tag(2)
            Profile()
                .tabItem {
                    Label("profile",
                          systemImage: "person.fill")
                }.tag(3)
        }
        .accentColor(.white)
    }
}

#Preview {
    ContentView()
}
