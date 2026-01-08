//
//  WelcomeView.swift
//  AIChat
//
//  Created by Shubham Mandal on 26/12/25.
//

import SwiftUI

struct WelcomeView: View {

    @State var imageName: String = Constants.randomImage
    @State private var showSignInView: Bool = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .ignoresSafeArea()
                titleSection
                    .padding(.top, 24)

                ctaButtons
                    .padding(16)

                policyLInks
            }

        }
        .sheet(isPresented: $showSignInView) {
            CreateAccountView(title: "Sign in", subtitle: "Connect to an existing account")
                .presentationDetents([.medium])
        }
    }
    private var titleSection: some View {
        VStack {
            Text("AI Chat 😃")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text("by Shubham Mandal")
                .foregroundStyle(.secondary)
                .font(.caption)
        }
    }
    private var ctaButtons: some View {
        VStack(spacing: 8) {
            NavigationLink {
                OnboardingIntroView()
            } label: {
                Text("Get Started!")
                    .callToActionButton()
            }

            Text("Already have an account? Sign in.")
                .underline()
                .font(.body)
                .padding(8)
                .tappableBackground()
                .onTapGesture {
                    onSignInPressed()
                }
        }
    }
    private func onSignInPressed() {
        showSignInView = true
    }
    private var policyLInks: some View {
        HStack(spacing: 8) {
            Link(destination: URL(string: Constants.termsOfServiceUrl)!) {
                Text("Terms of Service")
                    .font(.body)
            }

            Circle()
                .fill(Color.accent)
                .frame(width: 4, height: 4)

            Link(destination: URL(string: Constants.privacyPolicyUrl)!) {
                Text("Privacy Policy")
                    .font(.body)
            }
        }
    }
}

#Preview {
    WelcomeView()
}
