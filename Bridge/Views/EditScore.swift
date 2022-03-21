//
//  EditScore.swift
//  Bridge
//
//  Created by Дарий Клементьев on 21.03.2022.
//

import SwiftUI

struct EditScore: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var player: Player

    var body: some View {
        Form {
            TextField("New score", value: $player.score, formatter: NumberFormatter())
                .keyboardType(.decimalPad)
        }
        .navigationTitle(player.name!)
        .navigationBarBackButtonHidden(false)
        .toolbar {
            ToolbarItem {
                Button("Save") {
                    save()
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
    
    private func save() {
        try? viewContext.save();
    }
}
