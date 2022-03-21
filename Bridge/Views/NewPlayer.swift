//
//  NewPlayer.swift
//  Bridge
//
//  Created by Дарий Клементьев on 21.03.2022.
//

import SwiftUI

struct NewPlayer: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    @State var name: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
            }
            .navigationTitle("New Player")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem {
                    Button("Save") {
                        save()
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func save() {
        let player = Player(context: viewContext)
        player.name = name
        player.score = 0
        
        try? viewContext.save()
    }
}

