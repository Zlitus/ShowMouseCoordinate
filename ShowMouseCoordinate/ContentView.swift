//
//  ContentView.swift
//  ShowMouseCoordinate
//
//  Created by Arnaud Lefort on 12/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var cursorPosition: CGPoint = .zero
    @State private var isCursorInsideWindow = false

    var body: some View {
        VStack {
            if (isCursorInsideWindow || isCursorOnTitleBar()) {
                Text("Made with ❤️ by Zlitus")
            } else {
                Text("Position X: \(Int(cursorPosition.x))")
                Text("Position Y: \(Int(NSScreen.main!.frame.height - cursorPosition.y))")
            }
        }
        .frame(width: 235, height: 60)
        .onAppear {
            NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) { event in
                self.cursorPosition = event.locationInWindow
                return event
            }
        }
        .onHover { isHovered in
            self.isCursorInsideWindow = isHovered
        }
    }

    private func isCursorOnTitleBar() -> Bool {
        let cursorLocation = NSEvent.mouseLocation
        let windowFrame = NSApplication.shared.windows.first?.frame ?? .zero
        return NSPointInRect(cursorLocation, windowFrame)
    }
}

//#Preview {
//    ContentView().fixedSize()
//}
