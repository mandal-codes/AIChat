//
//  ChatModel.swift
//  AIChat
//
//  Created by Shubham Mandal on 04/01/26.
//

import Foundation

struct ChatModel: Identifiable {
    let id: String
    let userId: String
    let avatarId: String
    let dateCreated: Date
    let dateModified: Date

    static var mock: ChatModel {
        mocks[0]
    }
    
    static var mocks: [ChatModel] {
        let now = Date()

        return [
            ChatModel(
                id: "chat_0001",
                userId: "user_0001",
                avatarId: "avatar_0001",
                dateCreated: now.adding(days: -7, hours: -2),
                dateModified: now.adding(days: -7, hours: -1, minutes: -10)
            ),
            ChatModel(
                id: "chat_0002",
                userId: "user_0001",
                avatarId: "avatar_0002",
                dateCreated: now.adding(days: -3, hours: -5),
                dateModified: now.adding(days: -3, hours: -4, minutes: -20)
            ),
            ChatModel(
                id: "chat_0003",
                userId: "user_0002",
                avatarId: "avatar_0003",
                dateCreated: now.adding(days: -1, hours: -6),
                dateModified: now.adding(days: -1, hours: -3, minutes: -45)
            ),
            ChatModel(
                id: "chat_0004",
                userId: "user_0003",
                avatarId: "avatar_0001",
                dateCreated: now.adding(hours: -12),
                dateModified: now.adding(hours: -2, minutes: -30)
            )
        ]
    }
}
