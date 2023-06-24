//
//  ContentView.swift
//  Quirky Compliments Make Me Happy!!!
//
//  Created by Koo  on 24/6/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            PetView()
            .tabItem {
            Label("Homepage", systemImage: "person")
            }
            ComplimentView()
            .tabItem {
            Label("Compliments", systemImage: "hand.thumbsup.fill")
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
