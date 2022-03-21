//
//  ContentView.swift
//  Bridge
//
//  Created by Дарий Клементьев on 20.03.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [], animation: .default)
    private var players: FetchedResults<Player>
    
    @State private var showingNewPlayer = false
    @State private var showingNewGameAlert = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(players) { player in
                    NavigationLink(destination: EditScore(player: player)) {
                        Text(player.name!)
                        Spacer()
                        Text("Score \(player.score)").opacity(0.5)
                    }
                }
            }
            .overlay(Group {
                if players.isEmpty {
                    Text("There are no Players")
                }
            })
            .navigationTitle("Bridge Note")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("New Game") {
                        showingNewGameAlert.toggle()
                    }
                    .alert("Are you sure?", isPresented: $showingNewGameAlert) {
                        Button("Yeah", role: .destructive) {
                            newGame()
                        }
                        Button("Nope", role: .cancel) {}
                    }
                    
                }
                
                ToolbarItem() {
                    Button("Add Player") {
                        showingNewPlayer.toggle()
                    }
                    .sheet(isPresented: $showingNewPlayer) {
                        NewPlayer()
                    }
                }
            }
        }
    }
    
    private func newGame() {
        for player in players {
            viewContext.delete(player)
        }
        
        try? viewContext.save()
    }
}
