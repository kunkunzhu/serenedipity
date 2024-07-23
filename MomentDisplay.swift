//
//  File.swift
//  serenedipity-0
//
//  Created by Kun Zhu on 2024-07-10.
//

import SwiftUI

struct MomentImage: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 1)
            }
            .shadow(color: .white, radius: 7)
    }
}

struct MomentRow: View {
    var moment: Moment
    
    @ScaledMetric var imageWidth: CGFloat = 40
    
    var body: some View {
        HStack {
            MomentImage(image: moment.image)
                .padding(.trailing, 10)
            VStack(alignment: .leading, spacing: 5) {
                Text(moment.description)
                    .italic()
                Text(moment.date
                    .formatted(date:
                            .abbreviated, time:
                            .shortened))
                .font(.caption)
            }.colorInvert()
        }
    }
}

struct MomentRow_Previews: PreviewProvider {
    static var previews: some View {
        MomentRow(moment: Moment.example)
    }
}
