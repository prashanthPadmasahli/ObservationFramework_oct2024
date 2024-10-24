//
//  ContentView2.swift
//  ObservationFramework_oct2024
//
//  Created by mac on 23/10/24.
//

import SwiftUI
import Observation

/// use case for @bindable

struct ContentView2: View {
    @State var id = UUID()
    @State var vm = CounterVM()
    
    var body: some View {
        VStack {
            Text("Name - \(vm.username)")
            
            Text("\(id)")
            Button("update id") {
                id = UUID()
            }
            
            CountetView1(vm: vm) /// Need bindable
            CountetView2(vm: vm) /// Need bindable
            CountetView4(vm: $vm) /// Need Binding
            CountetView3(vm: vm)  /// Bindable not required
        }
    }
}

@Observable
class CounterVM {
    var count = 0
    var username = ""
}


/// Approach-1 Since we are using text field here, so we need to bind username, so using @Bindable
struct CountetView1: View {
    @Bindable var vm: CounterVM
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
            
            Button("Update count") {
                vm.count += 1
            }
            
            TextField("user", text: $vm.username)
        }
        
    }
}

/// Approach-2
struct CountetView2: View {
    let vm: CounterVM
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
            
            Button("Update count") {
                vm.count += 1
            }
        }
        
        TextField("user", text: Bindable(vm).username)
    }
}

//aproach 3
struct CountetView4: View {
    @Binding var vm: CounterVM
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
            
            Button("Update count") {
                vm.count += 1
            }
        }
        
        TextField("user", text: $vm.username)
    }
}


/// @Bindable not required bcz we are not binding($) the value to any field
struct CountetView3: View {
    let vm: CounterVM
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
            
            Button("Update count") {
                vm.count += 1
            }
        }
    }
}

#Preview {
    ContentView2()
}
