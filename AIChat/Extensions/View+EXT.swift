//
//  View+EXT.swift
//  AIChat
//
//  Created by Shubham Mandal on 26/12/25.
//

import SwiftUI

extension View {
    func callToActionButton() -> some View {
        self
            .font(.headline)
            .foregroundStyle(Color.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.accent)
            .cornerRadius(16)
    }

    func tappableBackground() -> some View {
        contentShape(Rectangle())
    }
}
