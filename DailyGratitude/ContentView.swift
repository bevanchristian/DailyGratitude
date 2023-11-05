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
    
    @State private var searchText = ""
    @State private var searchIsActive = false
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            GeometryReader(content: { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    HStack {
                        Text("Hello Bevan")
                            .font(.title)
                            .fontWeight(.black)
                        Spacer()
                        Button {
                            print("Filter")
                        } label: {
                            HStack(content: {
                                Image(systemName: "gear")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            })
                            .foregroundStyle(.black)
                        }
                    }
                    .padding()
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
                        VStack(content: {
                            Button {
                                print("create journal")
                            } label: {
                                HStack(content: {
                                    Image(systemName: "plus.circle")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    Text("Create Journal")
                                        .fontWeight(.bold)
                                        .fontDesign(.rounded)
                                })
                                .foregroundStyle(.black)
                                .padding(.vertical, 15)
                                .frame(width: geometry.size.width * 0.8)
                                .border(Color.gray, width: 2)
                                .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                                .shadow(radius: 10)
                                
                                
                                
                            }
                        })
                        HStack(alignment: .center, content: {
                            Text("History")
                                .font(.headline)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                            Button {
                                print("Filter")
                            } label: {
                                HStack(content: {
                                    Image(systemName: "line.horizontal.3.decrease.circle")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                })
                                .foregroundStyle(.black)
                            }
                            
                            Spacer()
                        })
                        .padding()
                        LazyVGrid(columns: columns, content: {
                            ForEach(1...10, id: \.self) { count in
                                DailyGratitudeCarouselCardView(imageAsset: .constant("fire"), description: .constant("Daily Dose \(count)"))
                                    .scrollTransition { effect, phase in
                                        effect
                                            .scaleEffect(phase.isIdentity ? 1: 0.3)
                                            .blur(radius: phase.isIdentity ? 0: 10)
                                            .opacity(phase.isIdentity ? 1 : 0.01)
                                    }
                            }
                        })
                        
                    })
                    
                }
                
            })
            
            
        }
        
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
