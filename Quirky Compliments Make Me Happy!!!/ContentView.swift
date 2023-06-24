//
//  ContentView.swift
//  Quirky Compliments Make Me Happy!!!
//
//  Created by Koo  on 24/6/23.
//

import SwiftUI

struct ContentView: View {
    
    let compliments = [
        "Your smile is contagious, like a laughter epidemic!",
        "You're so cool, you make ice jealous.",
        "You're a master of randomness, in a good way!",
        "Your fashion sense is out of this world, literally!",
        "Your jokes should be in a museum because they're truly works of art.",
        "You have a heart of gold, and I'm not just talking about your jewelry."
    ]
    
    @State private var index = 0
    @State private var showCompliment = false
    @State private var showAlert = false
    @State private var isPositiveFeedback = false
    
    
    var body: some View {
        VStack {
            Text("Quirky Compliments")
                .font(.largeTitle)
                .padding()
            if showCompliment == true {
                Text(compliments[index])
                    .multilineTextAlignment(.center)
            }
            Button {
                withAnimation{
                    showCompliment = true
                }
               
            } label: {
                Text("Generate Compliment")
                    .font(.title)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
    //VStack closing
        }
        .alert("Did you like that compliments?", isPresented: $showAlert) {
            Button("Yes!!!", role: .cancel){
                isPositiveFeedback = true
            }
            Button("Noooo!!!", role: .destructive){
                isPositiveFeedback = false
            }
        }
        .onTapGesture {
            showAlert = true
            if showCompliment {
                index += 1
                showCompliment = false
                if index == compliments.count {
                    index = 0
                    print("Restarted")
                    
                }
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
