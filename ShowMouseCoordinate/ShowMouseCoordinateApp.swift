//
//  ShowMouseCoordinateApp.swift
//  ShowMouseCoordinate
//
//  Created by Arnaud Lefort on 12/07/2023.
//

import SwiftUI

@main
struct ShowMouseCoordinateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .onAppear {
                NSWindow.allowsAutomaticWindowTabbing = false
            }
            .onDisappear {
                NSApp.terminate(nil)
            }
        }
        // Empêche qu'on puisse redimentionner
        .windowResizability(.contentSize)
        // Empêche qu'on puisse ouvrir plusieurs fenêtres
        .commands {
            CommandGroup(replacing: .newItem, addition: { })
        }
    }
}
