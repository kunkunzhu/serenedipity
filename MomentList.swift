//
//  MomentList.swift
//  serenedipity-0
//
//  Created by Kun Zhu on 2024-06-30.
//

import SwiftUI

struct MomentList: View {
    
    @ObservedObject var momentData: MomentData
    @State private var selection: Moment?
    
    let clearGradient = LinearGradient(
        gradient: Gradient(colors: [.white, .clear]),
        startPoint: .topTrailing,
        endPoint: .bottomLeading)
    
    var body: some View {
        List(selection: $selection) {
            ForEach(Period.allCases) { period
                in
                Section(content: {
                    ForEach(momentData
                        .sortedMoments(period: period)) {
                            $moment in MomentRow(moment: moment)
                                .tag(moment)
                        }
                }, header: {
                    Text(period.name)
                        .font(.callout)
                        .colorInvert()
                })
                .disabled(momentData
                    .sortedMoments(period: period).isEmpty)
            }.listRowBackground(Color.clear)
        }.scrollContentBackground(.hidden)
    }
}

//struct MomentList_Previews: PreviewProvider {
//    static var previews: some View {
//        MomentList(momentData: MomentData())
//    }
//}

#Preview {
    ContentView()
}
