//
//  SettingsView.swift
//  TimesTables
//
//  Created by Derek Velzy on 11/11/21.
//

import SwiftUI

struct SettingsView: View {
    @State private var level = 3
    @State private var questions = 5
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack(alignment: .leading) {
                        Text("Set range of values")
                            .font(.headline)
                        Stepper(value: $level, in: 3...20, step: 1) {
                            Text("2 - \(level)")
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("How many questions?")
                            .font(.headline)
                        Stepper(value: $questions, in: 5...25, step: 5) {
                            Text("\(questions)")
                        }
                    }
                }
                
                Section {
                    NavigationLink(
                        destination: ContentView(
                            level: level,
                            questions: questions
                        )) {
                        Text("Start game!")
                    }
                }
            }
            .navigationTitle("Game Settings")
        }
    }
}
