//
//  UserModel.swift
//  AIChat
//
//  Created by Shubham Mandal on 07/01/26.
//

import Foundation
import SwiftUI

struct UserModel {
    let userId: String
    let dateCreated: Date?
    let didCompleteOnboarding: Bool?
    let profileColorHex: String?

    init(
        userId: String,
        dateCreated: Date? = nil,
        didCompleteOnboarding: Bool? = nil,
        profileColorHex: String? = nil
    ) {
        self.userId = userId
        self.dateCreated = dateCreated
        self.didCompleteOnboarding = didCompleteOnboarding
        self.profileColorHex = profileColorHex
    }

    var profileColorCalculated: Color {
        guard let profileColorHex else { return .accentColor }
        return Color(hex: profileColorHex)
    }
    
    static var mock: Self {
        mocks[0]
    }

    static var mocks: [Self] {
        let now = Date()

        return [
            UserModel(
                userId: "user_0001",
                dateCreated: now.adding(days: -60),
                didCompleteOnboarding: true,
                profileColorHex: "#34C759"
            ),
            UserModel(
                userId: "user_0002",
                dateCreated: now.adding(days: -21, hours: -6),
                didCompleteOnboarding: true,
                profileColorHex: "#FF3B30"
            ),
            UserModel(
                userId: "user_0003",
                dateCreated: now.adding(days: -7, hours: -2),
                didCompleteOnboarding: false,
                profileColorHex: "#007AFF"
            ),
            UserModel(
                userId: "user_0004",
                dateCreated: now.adding(days: -1, hours: -3, minutes: -15),
                didCompleteOnboarding: nil,
                profileColorHex: nil
            )
        ]
    }
}
