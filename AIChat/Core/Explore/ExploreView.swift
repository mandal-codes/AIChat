//
//  ExploreView.swift
//  AIChat
//
//  Created by Shubham Mandal on 26/12/25.
//

import SwiftUI

struct ExploreView: View {
    @State private var featuredAvatars: [AvatarModel] = AvatarModel.mocks
    @State private var popularAvatars: [AvatarModel] = AvatarModel.mocks

    @State private var categories: [CharacterOption] = CharacterOption.allCases
    var body: some View {
        NavigationStack {
            List {
                featuredSection
                categorySection
                popularSection
            }
            .navigationTitle("Explore")
        }
    }
    private var featuredSection: some View {
        Section {
            ZStack {
                CarouselView(
                    items: featuredAvatars) { avatar in
                        HeroCellView(
                            title: avatar.name,
                            subtitle: avatar.characterDescription,
                            imageName: avatar.profileImageName
                        )
                        .anyButton() {
                            
                        }
                    }
            }
            .removeListRowFormatting()
        } header: {
            Text("Featured Avatars")
        }
    }
    private var categorySection: some View {
        Section {
            ZStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in
                            CategoryCellView(title: category.rawValue.capitalized)
                                .anyButton {

                                }
                        }
                    }
                }
                .frame(height: 150)
                .scrollTargetLayout()
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.viewAligned)
            }
            .removeListRowFormatting()
        } header: {
            Text("Categories")
        }
    }
    private var popularSection: some View {
        Section {
            ForEach(popularAvatars, id: \.self) {avatar in
                CustomListCellView(
                    imageName: avatar.profileImageName,
                    title: avatar.name,
                    subtitle: avatar.characterDescription
                )
                .anyButton(.highlight, action: {
                    
                })
                .removeListRowFormatting()
            }
        } header: {
            Text("Popular")
        }
    }
}

#Preview {
    ExploreView()
}
