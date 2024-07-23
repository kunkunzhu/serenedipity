//
//  File.swift
//  serenedipity-0
//
//  Created by Kun Zhu on 2024-06-29.
//

import Foundation
import SwiftUI

enum Period: String, CaseIterable, Identifiable {
    case pastWeek = "Past Week"
    case pastMonth = "Past Month"
    case past = "Past"
    
    var id: String {self.rawValue}
    var name: String {self.rawValue}
}

struct Moment: Identifiable, Hashable, Codable {
    var id = UUID()
    var description: String = ""
    var date: Date = Date.now
    
    var imageUrl: String = "placeholder"
    var image: Image {
        Image(imageUrl)
    }
    
    var period: Period {
        if date < Date.now.weekRange {
            return .pastWeek
        } else if date < Date.now.monthRange {
            return .pastMonth
        } else {
            return .past
        }
    }
    
    static var example = Moment(
        description: "breathtaking light pouring into Vendome metro station",
        date: Date.from(month: 6, day: 2, year: 2024),
        imageUrl: "vendome")
}

extension Date {
    var weekRange: Date {
        Calendar
            .autoupdatingCurrent
            .date(byAdding: .day, value: -7, to: self) ?? self
    }
    
    var monthRange: Date {
        Calendar
            .autoupdatingCurrent
            .date(byAdding: .month, value: -1, to: self) ?? self
    }
}
