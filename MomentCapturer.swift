//
//  MomentCapturer.swift
//  serenedipity-0
//
//  Created by Kun Zhu on 2024-07-22.
//

import SwiftUI

struct ViewfinderView: View {
    @Binding var image: Image?
    
    var body: some View {
        GeometryReader { geometry in
            if let image = image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

struct MomentCapturer: View {
    
    @StateObject private var model = DataModel()
    
    var body: some View {
        GeometryReader { geometry in
            ViewfinderView(image: $model.viewfinderImage)
                .overlay(alignment: .top) {
                    Color.black
                        .opacity(0.75)
                        .frame(height: geometry.size.height * 0.15)
                }
                .overlay(alignment: .center) {
                    Circle()
                        .stroke(.black, lineWidth: 1)
                        .frame(height: geometry.size.height * 0.15)
                }
        }
        .task {
            await model.camera.start()
        }
        .ignoresSafeArea()
    }
}

struct MomentCapturer_Previews: PreviewProvider {
    static var previews: some View {
        MomentCapturer()
    }
}
