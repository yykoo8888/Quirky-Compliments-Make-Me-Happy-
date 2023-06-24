//
//  ContentView.swift
//  Quirky Compliments Make Me Happy!!!
//
//  Created by Koo  on 24/6/23.
//

import SwiftUI

struct ContentView: View {
    
    let compliments = [
        Compliment(setup:"Your smile is contagious, like a laughter epidemic!"),
        Compliment(setup:"You're so cool, you make ice jealous."),
        Compliment(setup:"You're a master of randomness, in a good way!"),
        Compliment(setup:"Your fashion sense is out of this world, literally!"),
        Compliment(setup:"Your jokes should be in a museum because they're truly works of art."),
        Compliment(setup:"You have a heart of gold, and I'm not just talking about your jewelry."),
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
            Button {
                withAnimation{
                    showCompliment = true
                }
               
            } label: {
                Text("Generate Compliment")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            if showCompliment == true {
                Text(compliments[index].setup)
                    .multilineTextAlignment(.center)
                    .font(.title)
            }
    //VStack closing
        }
        .alert("Did you like that compliment?", isPresented: $showAlert) {
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
            //showCompliment = false
            }
            if index == compliments.count {
                index = 0
                print("Restarted")
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
