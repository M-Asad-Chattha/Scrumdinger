//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 25/01/2023.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
