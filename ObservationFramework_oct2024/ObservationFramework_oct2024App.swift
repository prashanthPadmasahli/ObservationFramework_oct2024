//
//  ObservationFramework_oct2024App.swift
//  ObservationFramework_oct2024
//
//  Created by mac on 18/10/24.
//

import SwiftUI

@main
struct ObservationFramework_oct2024App: App {
    @State var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView4()
                .environment(appState)
        }
    }
}
