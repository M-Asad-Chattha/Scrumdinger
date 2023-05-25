//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 26/02/2023.
//

import SwiftUI

struct HistoryView: View {
    let history : History
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeeString)
                
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attendeeString : String {
        // ListFormatter converts the attendees data into a single, comma-separated string.
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var history: History =  History(attendees: [DailyScrum.Attendee(name: "Asad"), DailyScrum.Attendee(name: "Musa"), DailyScrum.Attendee(name: "Haider")], lengthInMinutes: 10, transcript: "Musa, would you like to start today? Sure, yesterday I reviewed Haider' PR and met with the design team to finalize the UI...")
    
    static var previews: some View {
        HistoryView(history: history)
    }
}
