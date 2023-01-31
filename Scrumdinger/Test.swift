//
//  Test.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 27/01/2023.
//

import SwiftUI

struct Test: View {
    @State private var showSettings = false
    
    var body: some View {
        Button("View Settings") {
            showSettings = true
        }
        .sheet(isPresented: $showSettings) {
            Text("In the name Of Allah")
                .presentationDetents([.medium])
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
