//
//  Test.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 27/01/2023.
//

import SwiftUI

struct Test: View {
    let colors: [Color] = [.red, .green, .blue]
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Button("Scroll to view 8") {
                    withAnimation {
                        proxy.scrollTo(8, anchor: .bottomTrailing)
                    }
                }
                
                ForEach(0..<15) { i in
                    Text("Text Number \(i)")
                        .frame(width: 200, height: 100)
                        .background(.red)
                        .id(i)
                }
            }
        }
        .frame(height: 350)
        
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
