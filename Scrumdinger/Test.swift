//
//  Test.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 27/01/2023.
//
import SwiftUI

struct Test: View {
    @State private var showSettings = false
    @State private var flag = true
    
    var body: some View {
        VStack {
            Toggle("Toggle", isOn: $flag)
                .padding (.horizontal, 64)
            
            Button ("View Settings") {
                showSettings = true
            }
            
            Spacer ()
        }
        .padding(64)
        .sheet (isPresented: $showSettings) {
//        SettingsView()
            Text("Settings View")
                .presentationDetents ([.height (240) , .medium, .large])
//                .presentationBackgroundInteraction(.enabled(upThrough: .height(240)))
//        .presentationBackground(.thickMaterial)
        }
        
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
