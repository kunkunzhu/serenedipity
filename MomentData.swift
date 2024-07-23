//
//  MomentData.swift
//  serenedipity-0
//
//  Created by Kun Zhu on 2024-06-30.
//

import SwiftUI

class MomentData: ObservableObject {
    
    @Published var moments: [Moment] = [
        Moment(
            description: "breathtaking light pouring into Vendome metro station",
            date: Date.from(month: 6, day: 2, year: 2024),
            imageUrl: "vendome")
    ]
    
    func add(_ moment: Moment) {
        moments.append(moment)
    }
    
    func remove(_ moment: Moment) {
        moments.removeAll{$0.id == moment.id}
    }
    
    func sortedMoments(period: Period) ->
    Binding<[Moment]> {
        Binding<[Moment]>(
            get: {
                self.moments
                    .filter { $0.period == period }
                    .sorted { $0.date < $1.date }
            },
            set: { moments in
                for moment in moments {
                    if let idx =
                        self.moments.firstIndex(
                            where:{$0.id == moment.id}) {
                        self.moments[idx] = moment
                    }
                }}
        )
    }
}

extension Date {
    static func from(month: Int, day: Int, year: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let calendar = Calendar(identifier: .gregorian)
        if let date = calendar.date(from: dateComponents) {
            return date
        } else {
            return Date.now
        }
    }
}
