//
//  ButtonViewModifiers.swift
//  AIChat
//
//  Created by Shubham Mandal on 02/01/26.
//

import SwiftUI

struct HighlightButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .overlay {
                configuration.isPressed ? Color.accentColor.opacity(0.3) : Color.accentColor.opacity(0)
            }
            .animation(.smooth, value: configuration.isPressed)

    }
}

struct PressableButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.smooth, value: configuration.isPressed)

    }
}
#Preview {
    VStack {
        Text("Hello World")
            .font(Font.largeTitle)
            .padding()
            .frame(maxWidth: .infinity)
            .tappableBackground()
            .anyButton(.highlight, action: {

            })

        Text("Hello World")
            .font(Font.largeTitle)
            .padding()
            .frame(maxWidth: .infinity)
            .tappableBackground()
            .anyButton(.press) {
                
            }
    }

}
