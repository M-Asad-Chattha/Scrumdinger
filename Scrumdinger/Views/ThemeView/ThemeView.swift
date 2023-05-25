//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 28/01/2023.
//

import SwiftUI

/// You’ll use this theme view as a cell in a list to display all the themes to the user.
struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(theme.mainColor)
            Label(theme.name, systemImage: "paintpalette")
                .padding(4)
        }
        .foregroundColor(theme.accentColor)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .buttercup)
    }
}
