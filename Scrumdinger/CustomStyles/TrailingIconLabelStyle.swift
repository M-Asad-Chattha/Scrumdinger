//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 26/01/2023.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    // Configuration is of type LabelStyleConfiguration
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

// Extending LabelStyle features
extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
