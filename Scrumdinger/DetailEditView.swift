//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 27/01/2023.
//

import SwiftUI

struct DetailEditView: View {
    @State private var data = DailyScrum.Data()
    @State private var newAttendeeName: String = ""
    
    var body: some View {
        List {
            Section("Meeting Info") {
                TextField("Title", text: $data.title)
                
                HStack {
                    Slider(value: $data.lengthInMinutes, in: 5...30, step: 1) {
                        // The Text view won’t appear on screen, but VoiceOver
                        // uses it to identify the purpose of the slider.
                        Text("Length")
                    }
                    .accessibilityLabel("\(Int(data.lengthInMinutes)) minutes")
                    Text("\(Int(data.lengthInMinutes)) minutes")
                    // Hide the text view from VoiceOver.
                        .accessibilityHidden(true)
                }
            }
            
            Section("Attendees") {
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                // The framework calls the closure you pass to onDelete
                // when the user swipes to delete a row.
                .onDelete { indices in
                    data.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button (action :{
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            data.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                    
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailEditView()
        }
    }
}
