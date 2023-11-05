//
//  JournalDetailView.swift
//  DailyGratitude
//
//  Created by IDN MEDIA on 05/11/23.
//

import SwiftUI

struct JournalDetailView: View {
    @State var journalText: String = "Placeholder"
    @State var journalTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        GeometryReader(content: { geometry in
            VStack {
                Text("12 September 2023")
                HStack {
                    Text("Title")
                    Spacer()
                    TextField(
                           "Input Your Title",
                           text: $journalTitle
                       )
                }
 
                TextEditor(text: $journalText)
                    .foregroundColor(Color.gray)
                    .fontWeight(.medium)
                    .fontDesign(.serif)
                    .lineSpacing(5)
                    .frame(height: geometry.size.height * 0.8)
                    .onTapGesture {
                        if self.journalText == "Placeholder" {
                            self.journalText = ""
                        }
                    }
            }
            .padding()
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        self.showAlert = true
                    }
                    .foregroundStyle(.primary)
                }
            })
            .alert(
                "Login failed.",
                isPresented: $showAlert
            ) {
                Button("Cancel") {
                    self.showAlert = false
                }
                Button("OK") {
                   print("Saved")
                    self.showAlert = false
                }
              
            } message: {
                Text("Save This Journal")
            }
        })

        
    }
}

#Preview {
    NavigationStack {
        JournalDetailView()
    }
}
