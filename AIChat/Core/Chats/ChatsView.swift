//
//  ChatsView.swift
//  AIChat
//
//  Created by Shubham Mandal on 26/12/25.
//

import SwiftUI

struct ChatsView: View {
    @State private var chats: [ChatModel] = ChatModel.mocks
    var body: some View {
        NavigationStack {
            List {
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        chat: chat,
                        currentUserId: nil) {
                            try? await Task.sleep(for: .seconds(2))
                            return .mock
                        } getLastChatMessage: {
                            try? await Task.sleep(for: .seconds(2))
                            return .mock
                        }
                        .anyButton(.highlight, action: {

                        })
                        .removeListRowFormatting()
                }
            }
                .navigationTitle("Chats")
        }
    }
}

#Preview {
    ChatsView()
}
