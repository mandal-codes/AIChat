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
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(chatMessages) { message in
                        let isCurrentUser = message.authorId == currentUser?.userId
                        ChatBubbleViewBuilder(
                            message: message,
                            isCurrentUser: isCurrentUser,
                            imageName: avatar?.profileImageName
                        )
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(8)
            }

            Rectangle()
                .frame(height: 50)

        }
        .navigationTitle(avatar?.name ?? "Chat")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
