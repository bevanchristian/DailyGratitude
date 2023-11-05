//
//  DailyGratitudeCarouselCardView.swift
//  DailyGratitude
//
//  Created by IDN MEDIA on 05/11/23.
//

import SwiftUI

struct DailyGratitudeCarouselCardView: View {
    @Binding var imageAsset: String
    @Binding var description: String
    var body: some View {
        VStack {
            Image(imageAsset)
                .resizable()
                .frame(width: 150, height: 200)
                .scaledToFill()
                .overlay {
                    VStack(content: {
                        Spacer()
                        Text(description)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                    })
                    .padding()
                }
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
    }
}

#Preview {
    DailyGratitudeCarouselCardView(imageAsset: .constant("fire"), description: .constant("Daily Dose 12"))
}
