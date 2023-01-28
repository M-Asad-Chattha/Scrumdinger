//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 26/01/2023.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        List {
            // Array binding syntax "$scrums" to easily bind each element of the list
            // of scrums to its associate detail view.
            ForEach($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Daily Scrums")
        .toolbar {
            Button (action: {}) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }
        
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ScrumsView(scrums: .constant(DailyScrum.sampleData))
        }
    }
}
