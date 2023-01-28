//
//  Test.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 27/01/2023.
//

import SwiftUI

struct Test: View {
    @State private var items: [String] = ["Item 1", "Item 2"]
    
    var body: some View {
        List {
            Section(header: Text("Items")) {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
                HStack {
                    Spacer()
                    Button("Add Item") {
                        self.items.append("New Item")
                    }
                }
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
