//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 26/01/2023.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var newScrumData = DailyScrum.Data()
    @State private var isPresentingNewScrumView = false
    // Call this saveAction when scenePhase is in-active (like; you go to home on iPhone)
    let saveAction: ()->Void
    
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
        .listRowSeparator(.hidden)
        .navigationTitle("Daily Scrums")
        .toolbar {
            Button (action: {
                isPresentingNewScrumView = true
            }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NavigationStack {
                DetailEditView(data: $newScrumData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewScrumView = false
                                newScrumData = DailyScrum.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newScrum = DailyScrum(data: newScrumData)
                                scrums.append(newScrum)
                                isPresentingNewScrumView = false
                                newScrumData = DailyScrum.Data()
                            }
                        }
                    }
            }
        }
        .onChange(of: scenePhase) { phase in
            // If scenePhase in inactive(like you go to Home on iPhone), save data
            if phase == .inactive { saveAction() }
        }
    }
    
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
        }
    }
}
