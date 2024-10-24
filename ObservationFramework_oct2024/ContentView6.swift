//
//  ContentView6.swift
//  ObservationFramework_oct2024
//
//  Created by mac on 24/10/24.
//

import SwiftUI
import Observation

/// The issue occured in ContentView5 will not happen here. Since we are using observation framework here

struct ContentView6: View {
    @State var user = User1(name: "Bob")
    
    var body: some View {
        VStack {
            Text(user.name)
            Text("\(user.status.update)")
            Button("Update") {
                user.status.update += 1
            }
        }
    }
}

@Observable
class User1 {
    var name: String = ""
    var status = Status2()
    
    init(name: String) {
        self.name = name
    }
}

@Observable
class Status2{
    var update = 0
}

#Preview {
    ContentView6()
}
