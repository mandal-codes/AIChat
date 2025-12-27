//
//  OnboardingColorView.swift
//  AIChat
//
//  Created by Shubham Mandal on 27/12/25.
//

import SwiftUI

struct OnboardingColorView: View {

    @State private var selectedColor: Color?
    let profileColors: [Color] = [.red, .green, .orange, .blue, .mint, .purple, .cyan, .teal, .indigo]
    var body: some View {
        ScrollView {
            colorGrid
                .padding(.horizontal, 24)
        }
        .safeAreaInset(edge: .bottom, content: {
            ZStack {
                if let selectedColor {
                    ctaButton
                        .transition(.move(edge: .bottom))
                }
            }
            .padding(24)
            .background(Color(uiColor: .systemBackground))
        })
        .animation(.bouncy, value: selectedColor)
    }

    private var ctaButton: some View {
        NavigationLink {
            OnboardingIntroView()
        } label: {
            Text("Get Started!")
                .callToActionButton()
        }
    }

    private var colorGrid: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible()), count: 3),
            alignment: .center,
            spacing: 16,
            pinnedViews: [.sectionHeaders],
            content: {
                Section(content: {
                    ForEach(profileColors, id: \.self) { color in
                        Circle()
                            .fill(.accent)
                            .overlay {
                                color
                                    .clipShape(Circle())
                                    .padding(selectedColor == color ? 10 : 0)
                            }
                            .onTapGesture {
                                selectedColor = color
                            }
                    }
                }, header: {
                    Text("Select a profile color")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                })
            }
        )
    }
}

#Preview {
    OnboardingColorView()
}
