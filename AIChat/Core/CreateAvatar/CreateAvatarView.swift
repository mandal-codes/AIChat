//
//  CreateAvatarView.swift
//  AIChat
//
//  Created by Shubham Mandal on 08/01/26.
//

import SwiftUI

struct CreateAvatarView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var avatarName: String = ""

    @State private var characterOption: CharacterOption = .default
    @State private var characterAction: CharacterAction = .default
    @State private var characterLocation: CharacterLocation = .default
    @State private var isGeneratingImage: Bool = false
    @State private var generatedImage: UIImage?
    @State private var isSaving: Bool = false

    var body: some View {
        NavigationStack {
            List {
                nameSection
                attributeSection
                imageSection
                saveSection
            }
            .navigationTitle(Text("Create Avatar"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    dismissButton
                }
            }
        }
    }

    private var nameSection: some View {
        Section {
            TextField("New Player 1", text: $avatarName)
        } header: {
            Text("Name your avatar *")
        }
    }

    private var attributeSection: some View {
        Section {
            Picker("is a...", selection: $characterOption) {
                ForEach(CharacterOption.allCases, id: \.self) { option in
                    Text(option.rawValue.capitalized)
                        .tag(option)
                }
            }
            Picker("that is...", selection: $characterAction) {
                ForEach(CharacterAction.allCases, id: \.self) { option in
                    Text(option.rawValue.capitalized)
                        .tag(option)
                }
            }
            Picker("in the...", selection: $characterLocation) {
                ForEach(CharacterLocation.allCases, id: \.self) { option in
                    Text(option.rawValue.capitalized)
                        .tag(option)
                }
            }
        } header: {
            Text("Attributes")
        }
    }

    private var imageSection: some View {
        Section {
            HStack(alignment: .top, spacing: 8) {
                ZStack {
                    Text("Generate Image")
                        .foregroundStyle(Color.accent)
                        .underline()
                        .anyButton {
                            onGenerateButtonPressed()
                        }
                        .opacity(isGeneratingImage ? 0 : 1)
                    ProgressView()
                        .tint(.accent)
                        .opacity(isGeneratingImage ? 1 : 0)
                }
                .disabled(isGeneratingImage || avatarName.isEmpty)
                Circle()
                    .fill(Color.secondary.opacity(0.3))
                    .overlay {
                        if let generatedImage {
                            Image(uiImage: generatedImage)
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                        }
                    }
            }
            .removeListRowFormatting()
        }
    }

    private var saveSection: some View {
        Section {
            AsyncCallToActionButton(
                isLoading: isSaving,
                title: "Save",
                action: onSaveButtonPressed
            )
            .removeListRowFormatting()
            .padding(.top, 24)
            .opacity(generatedImage == nil ? 0.5 : 1)
            .disabled(generatedImage == nil)
        }
    }

    private var dismissButton: some View {
        Image(systemName: "xmark")
            .font(.title2)
            .fontWeight(.semibold)
            .anyButton(.plain) {
                onDismissButtonPressed()
            }
    }
    private func onDismissButtonPressed() {
        dismiss()
    }
    private func onSaveButtonPressed() {
        isSaving = true
        Task {
            try? await Task.sleep(for: .seconds(3))
            self.isSaving = false
            dismiss()
        }
    }
    private func onGenerateButtonPressed() {
        isGeneratingImage = true
        Task {
            try? await Task.sleep(for: .seconds(3))
            self.generatedImage = UIImage(systemName: "star.fill")
            self.isGeneratingImage = false
        }
    }
}

#Preview {
    CreateAvatarView()
}
