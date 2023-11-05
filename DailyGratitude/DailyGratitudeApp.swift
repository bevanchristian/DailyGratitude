//
//  DailyGratitudeApp.swift
//  DailyGratitude
//
//  Created by IDN MEDIA on 05/11/23.
//

import SwiftUI
import SwiftData

@main
struct DailyGratitudeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabView(selection: .constant(1)) {
                ContentView()
                    .badge(1)
                    .tabItem {
                        Label("Home", systemImage: "tray.and.arrow.down.fill")
                    }
                ContentView()
                    .badge(2)
                    .tabItem {
                        Label("Setting", systemImage: "tray.and.arrow.down.fill")
                    }
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
