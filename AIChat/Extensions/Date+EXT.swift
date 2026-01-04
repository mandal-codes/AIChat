//
//  Date+EXT.swift
//  AIChat
//
//  Created by Shubham Mandal on 04/01/26.
//

import Foundation

extension Date {
    func adding(days: Int = 0, hours: Int = 0, minutes: Int = 0) -> Date {
        let seconds =
        (TimeInterval(days) * 24 * 60 * 60) +
        (TimeInterval(hours) * 60 * 60) +
        (TimeInterval(minutes) * 60)

        return self.addingTimeInterval(seconds)
    }
}
