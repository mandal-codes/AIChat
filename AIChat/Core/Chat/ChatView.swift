//
//  ChatView.swift
//  AIChat
//
//  Created by Shubham Mandal on 09/01/26.
//

import SwiftUI

struct ChatView: View {
    @State var chatMessages: [ChatMessageModel] = ChatMessageModel.mocks
    @State var avatar: AvatarModel? = .mock
    @State var currentUser: UserModel? = .mock
    @State private var showChatSettings: Bool = false
    @State private var textfieldText: String = ""
    @State private var scrollPosition: String?
    var body: some View {
        VStack(spacing: 0) {
            scrollViewSection
            textfieldSection
        }
        .navigationTitle(avatar?.name ?? "Chat")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "ellipsis")
                    .foregroundStyle(.accent)
                    .padding(8)
                    .anyButton(.press) {
                        onChatSettingsButtonPressed()
                    }
            }
        }
        .confirmationDialog("", isPresented: $showChatSettings) {
            Button("Report User / Chat", role: .destructive) {

            }
            Button("Delete Chat", role: .destructive) {

            }
        }
    }

    private var scrollViewSection: some View {
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(chatMessages) { message in
                    let isCurrentUser = message.authorId == currentUser?.userId
                    ChatBubbleViewBuilder(
                        message: message,
                        isCurrentUser: isCurrentUser,
                        imageName: avatar?.profileImageName
                    )
                    .id(message.id)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(8)
            .rotationEffect(.degrees(180))
        }
        .rotationEffect(.degrees(180))
        .scrollPosition(id: $scrollPosition, anchor: .center)
        .animation(.default, value: chatMessages.count)
        .animation(.default, value: scrollPosition)
    }

    private var textfieldSection: some View {
        TextField("Say something...", text: $textfieldText)
            .keyboardType(.alphabet)
            .autocorrectionDisabled()
            .padding(12)
            .padding(.trailing, 60)
            .overlay(alignment: .trailing, content: {
                Image(systemName: "arrow.up.circle.fill")
                    .font(Font.system(size: 32))
                    .foregroundStyle(.accent)
                    .padding(.trailing, 4)
                    .anyButton {
                        onSendMessagePressed()
                    }
            })
            .background {
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color(uiColor: .systemBackground))
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(.gray, lineWidth: 1)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color(uiColor: .secondarySystemBackground))
    }
    private func onSendMessagePressed() {
        guard let currentUser, !textfieldText.isEmpty else { return }
        let content = textfieldText
        let newMessage = ChatMessageModel(
            id: UUID().uuidString,
            chatId: UUID().uuidString,
            authorId: currentUser.userId,
            content: content,
            seenByIds: nil,
            dateCreated: .now
        )

        chatMessages.append(newMessage)
        scrollPosition = newMessage.id
        textfieldText = ""
    }

    private func onChatSettingsButtonPressed() {
        showChatSettings = true
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
