//
//  ContentView.swift
//  ObservationFramework_oct2024
//
//  Created by mac on 18/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var vm = ContenetViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Foolower Count: \(vm.followersCount)")
                
                Button("Add follower") {
                    vm.addFollower()
                }
                
                NavigationLink(" goto child view") {
                    ChildView(vm: vm)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

import Observation
/// It completes eliminates the use of @StateObject and @ObservedObject
@Observable class ContenetViewModel {
    var followersCount = 0
   
    func addFollower() {
        followersCount += 1
    }
}


struct ChildView: View {
    var vm: ContenetViewModel
    
    var body: some View {
        VStack {
            Text("Foolower Count: \(vm.followersCount)")
            
            Button("Add follower") {
                vm.addFollower()
            }
        }
    }
}
