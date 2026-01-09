//
//  ChatBubbleView.swift
//  AIChat
//
//  Created by Shubham Mandal on 09/01/26.
//

import SwiftUI

struct ChatBubbleView: View {
    var text: String = "This is a test."
    var textColor: Color = .primary
    var backgroundColor: Color = .init(uiColor: .systemGray6)
    var imageName: String?
    var showImage: Bool = true
    private let offset: CGFloat = 14
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            if showImage {
                ZStack {
                    if let imageName = imageName {
                        ImageLoaderView(urlString: imageName)
                    } else {
                        Rectangle()
                            .fill(.secondary)
                    }
                }
                .frame(width: 45, height: 45)
                .clipShape(Circle())
                .offset(y: offset)
            }
            Text(text)
                .foregroundColor(textColor)
                .font(.body)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(backgroundColor)
                .cornerRadius(6)
        }
        .padding(.bottom, showImage ? offset : 0)
    }
}

#Preview {
    VStack(spacing: 0) {
        ScrollView {
            VStack(spacing: 24) {

                ChatBubbleView(text: "This is A LONG text to check the height calculation. This is A LONG text to check the height calculation. This is A LONG text to check the height calculation.")
                ChatBubbleView()
                ChatBubbleView()
                ChatBubbleView(text: "This is A LONG text to check the height calculation. This is A LONG text to check the height calculation. This is A LONG text to check the height calculation.", textColor: .white, backgroundColor: .accent, showImage: false)
                ChatBubbleView()
                ChatBubbleView(text: "This is A LONG text to check the height calculation. This is A LONG text to check the height calculation. This is A LONG text to check the height calculation.")
                ChatBubbleView()
            }
        }
        .scrollIndicators(.hidden)
        .padding()
    }
}
