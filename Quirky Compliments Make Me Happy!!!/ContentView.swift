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
        @State private var happinessIndex = 0
   
    var body: some View {
        TabView {
       //     PetView()
            VStack{
                Text("Happiness level: \(happinessIndex) / 50")
                if happinessIndex < 10 {
                    Image(systemName: "teddybear.fill")
                        .resizable()
                        .scaledToFit()
                } else if happinessIndex >= 10 && happinessIndex < 25 {
                    ZStack{
                        Image(systemName: "teddybear.fill")
                            .resizable()
                            .scaledToFit()
                        
                        Text("😀")
                            .font(.system(size: 295))
                            .offset(y: -70)
                            
                    }
                } else if happinessIndex >= 25 {
                    ZStack{
                        Image(systemName: "teddybear.fill")
                            .resizable()
                            .scaledToFit()
                        
                        Text("🤩")
                            .font(.system(size: 295))
                            .offset(y: -70)
                    }
                } else if happinessIndex == 50 {
                    ZStack{
                        Image(systemName: "teddybear.fill")
                            .resizable()
                            .scaledToFit()
                        
                        Text("🥳")
                            .font(.system(size: 295))
                            .offset(y: -70)
                    }
                }
            
                
            }
        
            .tabItem {
            Label("Homepage", systemImage: "person")
            }
            
           // ComplimentView()
            VStack {
                Text("Quirky Compliments")
                    .font(.largeTitle)
                    .padding()
                Text("Happiness level: \(happinessIndex) / 50")
                    .font(.title3)
                    .padding()
                Button {
                    withAnimation{
                        showCompliment = true
                    }
                    showAlert = true
                    if isPositiveFeedback == true {
                        happinessIndex += 5
                    }
                    else {
                        happinessIndex -= 2
                    }
                    if happinessIndex == 50 {
                        print("Yay! You are ecstatic!!!")
                    }
                    if showCompliment {
                        index += 1
                    //showCompliment = false
                    }
                    if index == compliments.count {
                        index = 0
                        print("Restarted")
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
            
            .tabItem {
            Label("Compliments", systemImage: "hand.thumbsup.fill")
            }
            //closing of TabView
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
