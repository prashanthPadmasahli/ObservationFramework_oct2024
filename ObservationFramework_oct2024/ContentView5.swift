//
//  ContentView5.swift
//  ObservationFramework_oct2024
//
//  Created by mac on 24/10/24.
//

import SwiftUI

///The problem with nested observable object(User and Status) will not update the UI. This can be solved by either using 1.user.objectWillChange.send() or making Stutus object to simple struct.
///This problem can be solved with observation framework - Conteview6()

struct ContentView5: View {
    @StateObject var user = User(name: "Bob")
    
    var body: some View {
        VStack {
            Text(user.name)
            Text("\(user.status.update)")
            Button("Update") {
                user.status.update += 1
               // user.objectWillChange.send()
            }
        }
    }
}

class User: ObservableObject {
    @Published var name: String = ""
    @Published var status = Status()
    
    init(name: String) {
        self.name = name
    }
}

class Status: ObservableObject {
    @Published var update = 0
}



// it will not work with nested Obervable Object. But works with simple struct

struct Status1 {
    var update = 0
}

#Preview {
    ContentView5()
}
