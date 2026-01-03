//
//  CustomListCellView.swift
//  AIChat
//
//  Created by Shubham Mandal on 30/12/25.
//

import SwiftUI

struct CustomListCellView: View {
    var imageName: String? = Constants.randomImage
    var title: String? = "Alien"
    var subtitle: String? = "An alien that is smiling in the park"
    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                if let imageName {
                    ImageLoaderView(urlString: imageName)
                } else {
                    Rectangle()
                        .fill(Color.secondary.opacity(0.5))
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 60)
            .cornerRadius(16)

            VStack(alignment: .leading, spacing: 4) {
                if let title {
                    Text(title)
                        .font(.headline)
                }
                if let subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .padding(.vertical, 4)
        .background(Color(uiColor: .systemBackground))
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.5)
        VStack {
            CustomListCellView()
            CustomListCellView(imageName: nil)

            CustomListCellView()
            CustomListCellView()
        }

    }
}
