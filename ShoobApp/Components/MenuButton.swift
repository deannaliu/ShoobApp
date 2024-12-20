//
//  MenuButton.swift
//  ShoobApp
//
//  Created by Deanna Liu on 12/19/24.
//

import SwiftUI

struct MenuButton: View {
    @State private var showMenu = false
    var body: some View {
        Button(action: {
            showMenu.toggle() // this is how you show or hide menu
        }, label: {
            Image(systemName: "line.horizontal.3")
        })
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton()
    }
}
