//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 25/01/2023.
//

import SwiftUI

struct MeetingView: View {
    @State private var progress: Double = 7.5 // TODO: Remove Hard-Coded Value
    @State private var meetingTime: Double = 15 // TODO: Remove Hard-Coded Value
    
    var body: some View {
//        ScrollView {
            VStack {
                ProgressView(value: progress, total: meetingTime)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Seconds Elapsed")
                            .font(.caption)
                        Label("300", systemImage: "hourglass.bottomhalf.filled")
                        
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Seconds Remaining")
                            .font(.caption)
                        Label("600", systemImage: "hourglass.tophalf.filled")
                    }
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Time remaining")
                .accessibilityValue("10 minutes")
                
                Circle()
                    .strokeBorder(lineWidth: 24)
                
                HStack {
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                    }
                    // VoiceOver reads the label, followed by the inherent accessibility trait:
                    // “Next speaker. Button.”
                    .accessibilityLabel("Next Speaker")
                }
                
            }
            .padding()
//        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
