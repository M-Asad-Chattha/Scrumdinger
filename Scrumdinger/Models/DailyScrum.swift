//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 25/01/2023.
//

import Foundation

struct DailyScrum {
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var theme: Theme
}

// MARK: - Extension - Sample Data

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
    ]
}

extension DailyScrum {
    static var sampleData1: [DailyScrum] {
        [
            DailyScrum(title: "Scrum Meeting 1", attendees: ["John","Mike","Amy"], lengthInMinutes: 30, theme: .yellow),
            DailyScrum(title: "Scrum Meeting 2", attendees: ["Jane","Bob","Emily"], lengthInMinutes: 45, theme: .orange),
            DailyScrum(title: "Scrum Meeting 3", attendees: ["Luke","Leia","Han"], lengthInMinutes: 60, theme: .poppy)
        ]
    }
}
