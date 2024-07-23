//
//  ContentView.swift
//  serenedipity-0
//
//  Created by Kun Zhu on 2024-06-28.
//

import SwiftUI

struct Home: View {
    
//    @ObservedObject var serendipityData: Text
    
    @State private var isAddingNewMoment = false
    @State private var newMoment = Moment()
    
    let backgroundGradient = LinearGradient(
        colors: [Color.indigo, Color.black],
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    let promptText = "what serendipity would you like to capture?"
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            VStack{
                Text(promptText)
                    .font(.title)
                    .colorInvert()
                    .frame(width: 250)
                    .multilineTextAlignment(.center)
                    .padding(20)
                PromptCircle()
                    .frame(height: 150)
                    .onTapGesture {
                        newMoment = Moment()
                        isAddingNewMoment = true
                    }
            }.sheet(isPresented: $isAddingNewMoment) {
                VStack{
                    MomentEditor(moment: $newMoment)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button {
                                    isAddingNewMoment = false
                                } label: {
                                    Image(systemName: "xmark")
                                        .imageScale(.large)
                                }
                            }
                        }
                }
            }
        }
    }
    
}

#Preview {
    Home()
}
