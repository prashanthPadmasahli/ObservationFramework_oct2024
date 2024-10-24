//
//  ContentView3.swift
//  ObservationFramework_oct2024
//
//  Created by mac on 23/10/24.
//

import SwiftUI

// Diffrence between @Binding and @Bindable

struct ContentView3: View {
    @State var searchVM = SearchViewModel()
    
    var body: some View {
        Text(searchVM.query)
        
        SearchView1(vm: $searchVM) // need $ for Binding
        SearchView2(vm: searchVM)  // for bindable $ not required
    }
}

struct SearchView1: View {
    @Binding var vm: SearchViewModel
    
    var body: some View {
        SearchFiled(query: $vm.query)
    }
}

struct SearchView2: View {
    @Bindable var vm: SearchViewModel
    
    var body: some View {
        SearchFiled(query: $vm.query)
    }
}

struct SearchFiled: View {
    @Binding var query: String
    
    var body: some View {
        TextField("search", text: $query)
            .textFieldStyle(.roundedBorder)
            .padding()
    }
}

@Observable
class SearchViewModel {
    var query = ""
}

#Preview {
    ContentView3()
}
