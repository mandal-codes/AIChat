//
//  ChatRowCellViewBuilder.swift
//  AIChat
//
//  Created by Shubham Mandal on 05/01/26.
//

import SwiftUI

struct ChatRowCellViewBuilder: View {
    var chat: ChatModel = .mock
    var currentUserId: String? = ""
    var getAvatar: () async -> AvatarModel?
    var getLastChatMessage: () async -> ChatMessageModel?
    @State private var avatar: AvatarModel?
    @State private var lastChatMessage: ChatMessageModel?

    @State private var didLoadAvatar: Bool = false
    @State private var didLoadLastChatMessage: Bool = false

    private var isLoading: Bool {
        !(didLoadAvatar && didLoadLastChatMessage)
    }

    private var hasNewChat: Bool {
        guard let lastChatMessage, let currentUserId else { return false }

        return lastChatMessage.hasBeenSeenByCurrentUser(userId: currentUserId)
    }

    private var subheadline: String? {
        if isLoading {
            return "xxxx-xxxx-xxxx-xxxx"
        }

        if avatar == nil && lastChatMessage == nil {
            return "Error loading chat."
        }

        return lastChatMessage?.content
    }

    var body: some View {
        ChatRowCellView(
            imageName: avatar?.profileImageName,
            headline: isLoading ? "xxxx-xxxx" : avatar?.name,
            subheadline: subheadline,
            hasNewChat: isLoading ? false : hasNewChat
        )
        .redacted(reason: isLoading ? .placeholder : [])
        .task {
            avatar = await getAvatar()
            didLoadAvatar = true
        }
        .task {
            lastChatMessage = await getLastChatMessage()
            didLoadLastChatMessage = true
        }
    }

}

#Preview {
    VStack {
        ChatRowCellViewBuilder(getAvatar: {
            try? await Task.sleep(for: .seconds(5))
            return .mock
        }, getLastChatMessage: {
            try? await Task.sleep(for: .seconds(5))
            return .mock
        })
        ChatRowCellViewBuilder(getAvatar: {
            return .mock
        }, getLastChatMessage: {
            return .mock
        })
        ChatRowCellViewBuilder(getAvatar: {
            return nil
        }, getLastChatMessage: {
            return nil
        })
    }
}
