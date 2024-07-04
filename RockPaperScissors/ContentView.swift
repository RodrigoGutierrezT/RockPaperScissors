//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Rodrigo on 01-07-24.
//

import SwiftUI

struct MoveSymbol: View {
    var number: Int
    var moves: [String]
    var symbols: [String]
//    var action: (Int) -> Void
    
    var body: some View {
        Button {
//            action(number)
            print("hi")
        } label: {
            Text("\(symbols[number])")
                .font(.system(size: 50))
        }
        .frame(minWidth: 75, minHeight: 75)
        .background(Color(red: 0.4, green: 0.3, blue: 0.9))
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView: View {
    private let moves: [String] = ["Rock", "Paper", "Scissors"]
    private let symbols: [String] = ["👊", "📄", "✂️"]
    private let winningMoves: [String] = ["Paper", "Scissors", "Rock"]
    private let losingMoves: [String] = ["Scissors", "Rock", "Paper"]
    
    private var userMove: Int = 0
    private var computerMove: Int = Int.random(in: 0...2)
    
    private var promptToWin: Bool = Bool.random()
    
    @State var Score: Int = 0
    private let maxQuestions = 10
    @State private var currentQuestion = 1
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                Color(red: 0.8, green: 0.4, blue: 0.8),
                Color(red:0.9, green: 0.2, blue: 0.2)
            ], startPoint: .top, endPoint: .bottom)
            
            VStack {
                Spacer()
                VStack(spacing: 10) {
                    
                    VStack {
                        Text("Turn: \(currentQuestion)/\(maxQuestions)")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }.padding(20)
                    
                    Text("You need to \(promptToWin ? "Win" : "Lose")")
                        .font(.largeTitle.bold())
                    
                    Text("Computer move: \(moves[computerMove])")
                    Text("\(symbols[computerMove])")
                        .font(.system(size: 100))                }
                Spacer()
                
                Text("Choose your move!")
                    .font(.title)
                
                HStack(spacing: 15) {
                    ForEach(0..<3){ number in
                        MoveSymbol(number: number, moves: moves, symbols: symbols)
                    }
                }.padding(10)
                
                
                
                
                Spacer()
                Spacer()
            }

            
        }.ignoresSafeArea()
    }
    
    func buttonTapped(_ number: Int) {
        
    }
}

#Preview {
    ContentView()
}

