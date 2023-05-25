//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 20/02/2023.
//

import SwiftUI

struct MeetingTimerView: View {
    let speakers: [ScrumTimer.Speaker]
    let isRecording: Bool
    let theme: Theme
    private var currentSpeaker: String {
        speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
    }
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
        // Adding text to a layer in front of the circle
        // makes the text appear inside the circle.
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is speaking")
                    Image(systemName: isRecording ? "mic" : "mic.slash")
                        .font(.title)
                        .padding(.top)
                        .accessibilityLabel(isRecording ? "with transcription" : "without transcription")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay {
                ForEach(speakers) { speaker in
                    if speaker.isCompleted,
                        let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            // Rotating the arc moves the 0-degree angle to the 12 o’clock position.
                            .rotation(.degrees(-90))
                            .stroke(theme.mainColor, lineWidth: 12)
                    }
                }
            }
            // Padding to Circle
            .padding(.horizontal)
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    static var speakers: [ScrumTimer.Speaker]  {
        [ScrumTimer.Speaker(name: "Asad", isCompleted: true), ScrumTimer.Speaker(name: "Musa", isCompleted: true),
         ScrumTimer.Speaker(name: "Ahmed", isCompleted: true), ScrumTimer.Speaker(name: "haider", isCompleted: true),
         ScrumTimer.Speaker(name: "Ali", isCompleted: true), ScrumTimer.Speaker(name: "Asad", isCompleted: false)]
    }
    
    static var previews: some View {
        MeetingTimerView(speakers: speakers, isRecording: false, theme: .navy)
    }
}
