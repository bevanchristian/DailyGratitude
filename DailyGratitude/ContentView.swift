//
//  ContentView.swift
//  DailyGratitude
//
//  Created by IDN MEDIA on 05/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationStack {
            GeometryReader(content: { geometry in
                VStack(content: {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .center, spacing: 50, content: {
                            ForEach(1...10, id: \.self) { count in
                                DailyGratitudeCarouselCardView(imageAsset: .constant("fire"), description: .constant("Daily Dose \(count)"))
                                    .scrollTransition { effect, phase in
                                        effect
                                            .scaleEffect(phase.isIdentity ? 1: 0.3)
                                            .blur(radius: phase.isIdentity ? 0: 10)
                                            .opacity(phase.isIdentity ? 1 : 0.01)
                                    }
                                    .padding(.leading, count == 1 ? geometry.size.width * 0.15 : 0)
                                
                            }
                        })
                    }
                    .frame(minHeight: 150, maxHeight: geometry.size.height * 0.3)
                    .padding()
                    Spacer()
                    VStack(content: {
                        Text("Placeholder")
                        Text("Placeholder")
                        Text("Placeholder")
                        Text("Placeholder")
                    })
                })
            }).navigationTitle("Daily Gratitude")
            
            
        }
    }

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
