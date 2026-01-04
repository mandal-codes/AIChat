//
//  ChatMessageModel.swift
//  AIChat
//
//  Created by Shubham Mandal on 04/01/26.
//

import Foundation

struct ChatMessageModel {
    let id: String
    let chatId: String
    let authorId: String?
    let content: String?
    let seenByIds: [String]?
    let dateCreated: Date?

    init(id: String, chatId: String, authorId: String? = nil, content: String? = nil, seenByIds: [String]? = nil, dateCreated: Date? = nil) {
        self.id = id
        self.chatId = chatId
        self.authorId = authorId
        self.content = content
        self.seenByIds = seenByIds
        self.dateCreated = dateCreated
    }
    static var mock: ChatMessageModel {
        mocks[0]
    }

    static var mocks: [ChatMessageModel] {
        let now = Date()

        return [
            ChatMessageModel(
                id: "msg_0001",
                chatId: "chat_0001",
                authorId: "user_0001",
                content: "Hey! Ready to set up your workout plan for today?",
                seenByIds: ["user_0001"],
                dateCreated: now.adding(days: -7, hours: -2, minutes: -12)
            ),
            ChatMessageModel(
                id: "msg_0002",
                chatId: "chat_0001",
                authorId: "avatar_0001",
                content: "Absolutely. Tell me your goal—fat loss, strength, or endurance?",
                seenByIds: ["user_0001", "avatar_0001"],
                dateCreated: now.adding(days: -7, hours: -2, minutes: -5)
            ),
            ChatMessageModel(
                id: "msg_0003",
                chatId: "chat_0002",
                authorId: "user_0001",
                content: "Keep it light today. My knee feels a bit tender.",
                seenByIds: ["user_0001"],
                dateCreated: now.adding(days: -3, hours: -5, minutes: -30)
            ),
            ChatMessageModel(
                id: "msg_0004",
                chatId: "chat_0002",
                authorId: "avatar_0002",
                content: "Got it. We’ll do low-impact: cycling, glute bridges, and hamstring work. No jumping.",
                seenByIds: ["user_0001", "avatar_0002"],
                dateCreated: now.adding(days: -3, hours: -5, minutes: -22)
            ),
            ChatMessageModel(
                id: "msg_0005",
                chatId: "chat_0003",
                authorId: nil,
                content: nil,
                seenByIds: nil,
                dateCreated: now.adding(days: -1, hours: -6)
            ),
            ChatMessageModel(
                id: "msg_0006",
                chatId: "chat_0004",
                authorId: "user_0003",
                content: "Quick check-in: how many steps today?",
                seenByIds: ["user_0003"],
                dateCreated: now.adding(hours: -12, minutes: -10)
            )
        ]
    }
}
