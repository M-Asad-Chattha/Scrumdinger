//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 22/02/2023.
//

import SwiftUI

struct SpeakerArc: Shape {
    let speakerIndex: Int
    let totalSpeakers: Int
    
    var degreesPerSpeaker: Double {
        360.0 / Double(totalSpeakers)
    }
    var startAngle: Angle {
        // The additional 1.0 degree is to "offset" start point.
        // Exculding "1.0" it will also work.
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0)
    }
    var endAngle: Angle {
        // The subtracted 1.0 degree is for visual separation between arc segments.
        Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
    }
    
    func path(in rect: CGRect) -> Path {
        // Subtracting 24 will decrease circle diameter. Because the circle on which
        // we're overlaying is of stroke-lineWidth 24 so subtracting 24 will cause
        // radius to decrease by 12 and hence our arc of stroke-lineWidth 12 will in center
        // of inner circle's stroke.
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
    
    
}
