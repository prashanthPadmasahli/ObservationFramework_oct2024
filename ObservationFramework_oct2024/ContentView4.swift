//
//  ContentView4.swift
//  ObservationFramework_oct2024
//
//  Created by mac on 23/10/24.
//

import SwiftUI
import Observation

///Using @Environment value as bindable:

///Here you cannot bind apostate.user.name to textfield. So there are 2 approaches to solve the issue

struct ContentView4: View {
    @Environment(AppState.self) var appState
    
    var body: some View {
        Text(appState.person.name)
        /// This will not work. we have to make appState as bindable
        // TextField("Name", text: $appState.person.name)
        
        ///1st Approach - not good
        BindableTextField(appState: appState)
        
        ///2nd Approach - Best
        TextField("Name", text: Bindable(appState).person.name)
        
        ///3rd Approach
        TextField("Name1", text: Binding(get: {
            appState.person.name
        }, set: { newValue in
            appState.person.name = newValue
        }))
        
        ///4th Approach
        BindableTextField2(username: Bindable(appState).person.name)
    }
}

struct BindableTextField: View {
    @Bindable var appState: AppState
    var body: some View {
        TextField("Name", text: $appState.person.name)
    }
}

struct BindableTextField2: View {
    @Binding var username: String
    var body: some View {
        TextField("Name", text: $username)
    }
}

#Preview {
    ContentView4()
}

@Observable
class AppState {
    var person = Person()
    
    func fetchPerson() {
        self.person = Person(name: "New Person")
    }
}

struct Person {
    var name = ""
}
