//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 28/01/2023.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                // You can tag subviews when you need to differentiate
                // among them in controls like pickers and lists. Tag values
                // can be any hashable type like in an enumeration.
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.seafoam))
    }
}
