//
//  AppView.swift
//  AIChat
//
//  Created by Shubham Mandal on 26/12/25.
//

import SwiftUI

// tabbar - signed in
// onboarding - signed out

struct AppView: View {
    @State var appsState: AppState = AppState()
    var body: some View {
        AppViewBuilder(
            showTabBar: appsState.showTabBar,
            tabbarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .environment(appsState)
    }
}

#Preview("AppView - Tabbar") {
    AppView(appsState: AppState(showTabBar: true))
}

#Preview("AppView - Onboarding") {
    AppView(appsState: AppState(showTabBar: false))
}
