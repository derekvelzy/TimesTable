//
//  ContentView.swift
//  TimesTables
//
//  Created by Derek Velzy on 11/11/21.
//

import SwiftUI

struct ContentView: View {
    var level: Int
    var questions: Int
    
    @State private var round = 1
    @State private var a = 1
    @State private var b = 1
    @State private var c = ""
    @State private var correct = 0
    @State private var alert = false
    @State private var alertText = ""
    @State private var gameOver = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Total: \(correct)/\(questions)")
                }
    
                Section("Question \(round)/\(questions)") {
                    Text("\(a) x \(b) = ")
                    
                    TextField("Answer", text: $c)
                        .keyboardType(.decimalPad)
                }
                
                Button("Submit") {
                    submit()
                    if round == questions {
                        endGame()
                    } 
                }
            }
            .onAppear(perform: {
                randomize()
            })
            .alert(Text(alertText), isPresented: $alert) {
                Button(gameOver ? "New Game" : "Next") {
                    if gameOver {
                        round = 1
                        gameOver = false
                        correct = 0
                    } else {
                        round += 1
                    }
                    randomize()
                }
            } message: {
                if alertText == "Incorrect" {
                    Text("The answer is \(a * b)")
                } else if gameOver {
                    Text("You answered \(correct) out of \(questions) questions correctly")
                }
            }
            .navigationTitle("Times Tables")
        }
    }
    
    func submit() {
        if a * b == Int(c) {
            alertText = "Correct!"
            correct += 1
        } else {
            alertText = "Incorrect"
        }
        alert = true
    }
    
    func randomize() {
        c = ""
        a = Int.random(in: 1...level)
        b = Int.random(in: 1...level)
    }
    
    func endGame() {
        gameOver = true
        alertText = "Game over!"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(level: 3, questions: 5)
    }
}
