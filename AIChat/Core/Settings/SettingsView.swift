//
//  SettingsView.swift
//  AIChat
//
//  Created by Shubham Mandal on 26/12/25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appState
    var body: some View {
        NavigationStack {
            List {
                Button {
                    onSignOutPressed()
                } label: {
                    Text("Sign Out")
                        .callToActionButton()
                }

            }
            .navigationTitle("Settings")
        }
    }
    func onSignOutPressed() {
        dismiss()
        Task {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            appState.updateViewState(showTabBarView: false)
        }
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
