//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 26/01/2023.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(scrums) { scrum in
                    CardView(scrum: scrum)
                        .listRowBackground(scrum.theme.mainColor)
                }
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button {
                    // TODO: Add Button's action code
                } label: {
                    Image(systemName: "plus")
                }

            }
            
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
