//
//  SettingsView.swift
//  AIChat
//
//  Created by Shubham Mandal on 26/12/25.
//

import SwiftUI
import SwiftfulUtilities

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appState
    @State private var isPremium: Bool = false
    @State private var isAnonymousUser: Bool = false
    @State private var showCreateAccountView: Bool = false

    var body: some View {
        NavigationStack {
            List {
                Section {
                    if isAnonymousUser {
                        Text("Save & back-up account")
                            .rowFormatting()
                            .anyButton(.highlight) {
                                onCreateAccountButtonPressed()
                            }
                            .removeListRowFormatting()
                    } else {
                        Text("Sign out")
                            .rowFormatting()
                            .anyButton(.highlight) {
                                onSignOutPressed()
                            }
                            .removeListRowFormatting()
                    }

                    Text("Delete account")
                        .foregroundStyle(.red)
                        .rowFormatting()
                        .anyButton(.highlight) {
                        }
                        .removeListRowFormatting()

                } header: {
                    Text("Account")
                }

                Section {
                    HStack(spacing: 0) {
                        Text("Account status: \(isPremium ? "PREMIUM" : "FREE")")
                        Spacer(minLength: 0)
                        if isPremium {
                            Text("MANAGE")
                                .badgeButton()
                        }
                    }
                    .rowFormatting()
                    .anyButton(.highlight) {
                    }
                    .removeListRowFormatting()
                    .disabled(!isPremium)
                } header: {
                    Text("Purchases")
                }
                Section {
                    HStack(spacing: 0) {
                        Text("Version")
                        Spacer(minLength: 0)
                        Text(Utilities.appVersion ?? "")
                            .foregroundStyle(.secondary)
                    }
                    .rowFormatting()
                    .removeListRowFormatting()
                    HStack(spacing: 0) {
                        Text("Build Number")
                        Spacer(minLength: 0)
                        Text(Utilities.buildNumber ?? "")
                            .foregroundStyle(.secondary)
                    }
                    .rowFormatting()
                    .removeListRowFormatting()
                    Text("Contact us")
                        .foregroundStyle(.blue)
                        .rowFormatting()
                        .anyButton(.highlight) {
                        }
                        .removeListRowFormatting()
                } header: {
                    Text("Application")
                } footer: {
                    Text("Created by Shubham Mandal")
                }

            }
            .navigationTitle("Settings")
            .sheet(isPresented: $showCreateAccountView) {
                CreateAccountView()
                    .presentationDetents([.medium])
            }
        }
    }
    func onSignOutPressed() {
        dismiss()
        Task {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            appState.updateViewState(showTabBarView: false)
        }
    }
    func onCreateAccountButtonPressed() {
        showCreateAccountView = true
    }
}

fileprivate extension View {
    func rowFormatting() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color(uiColor: .systemBackground))
    }
}

#Preview {

    SettingsView()
        .environment(AppState())

}
