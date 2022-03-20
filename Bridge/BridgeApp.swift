//
//  BridgeApp.swift
//  Bridge
//
//  Created by Дарий Клементьев on 20.03.2022.
//

import SwiftUI

@main
struct BridgeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
