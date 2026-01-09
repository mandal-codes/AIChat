//
//  ChatBubbleViewBuilder.swift
//  AIChat
//
//  Created by Shubham Mandal on 09/01/26.
//

import SwiftUI

struct ChatBubbleViewBuilder: View {
    var message: ChatMessageModel = .mock
    var isCurrentUser: Bool
    var imageName: String?
    var body: some View {
        ChatBubbleView(
            text: message.content ?? "",
            textColor: isCurrentUser ? .white : .primary,
            backgroundColor: isCurrentUser ? .accent : .init(uiColor: .systemGray6),
            imageName: imageName,
            showImage: !isCurrentUser
        )
        .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
        .padding(.leading, isCurrentUser ? 75.0 : 0)
        .padding(.trailing, isCurrentUser ? 0 : 75.0)
    }
}

#Preview {
    VStack {
        ScrollView {
            VStack(spacing: 24) {
                ForEach(ChatMessageModel.mocks) { message in
                    ChatBubbleViewBuilder(
                        message: message,
                        isCurrentUser: Bool.random(),
                        imageName: nil
                    )
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding()
    }
}
