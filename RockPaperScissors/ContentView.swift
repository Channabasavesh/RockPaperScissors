//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Channabasavesh Chandrappa Budihal on 1/26/21.
//

import SwiftUI

struct ContentView: View {
    
    var moves = ["🤛", "✋", "✌️"]
    @State private var currentChoice = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        VStack (spacing: 100){
            
            ForEach(0..<moves.count) { (number) in
                Button(action: {
                    self.buttonTapped(number)
                }, label: {
                    Text("\(moves[number])")
                })
            }
            
            Text("Current Score: \(score)")
            
        }
        .alert(isPresented: $showingScore, content: {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")))
        })
    }
    
    func buttonTapped(_ number: Int) {
        if (number == 0 && currentChoice == 1) || (number == 1 && currentChoice == 2) || (number == 2 && currentChoice == 0) {
            score += 1
            scoreTitle = "Success"
        } else {
            score -= 1
            scoreTitle = "Incorrect"
        }
        showingScore = true
        currentChoice = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
