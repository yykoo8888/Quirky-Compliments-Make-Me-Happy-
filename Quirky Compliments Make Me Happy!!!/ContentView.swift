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
            Compliment(setup:"You're like a human emoji, always expressing yourself with the perfect facial expressions."),
            Compliment(setup:"Your imagination must be a treasure trove because you come up with the most wonderfully bizarre ideas!"),
            Compliment(setup:"If creativity were a superpower, you would be the superhero of the artistic world!"),
            Compliment(setup:"Your ability to find joy in the little things is truly inspiring. You could probably make a game out of folding laundry!"),
        ]
        
        @State private var index = 0
        @State private var showCompliment = false
        @State private var showAlert = false
        @State private var isPositiveFeedback = false
        @State private var happinessIndex = 0
        @State private var size = 295.0
   
    var body: some View {
        TabView {
       //     PetView()
            VStack{
                Text("Happiness level: \(happinessIndex) / 50")
                if happinessIndex < 10 {
                    ZStack{
                        Image("rain")
                            .resizable()
                            .frame(width: 450, height: 450)
                        
                        Image(systemName: "teddybear.fill")
                            .resizable()
                            .scaledToFit()
                        
                        Text("😭")
                            .font(.system(size: size))
                            .offset(y: -80)
                            .onTapGesture {
                                size += 4
                                happinessIndex += 2
                            }
                    }
                } else if happinessIndex >= 10 && happinessIndex < 25 {
                    ZStack{
                        LinearGradient(
                            gradient: Gradient(colors: [Color.red, Color.blue]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                                .edgesIgnoringSafeArea(.all)
                        
                        Image(systemName: "teddybear.fill")
                            .resizable()
                            .scaledToFit()
                        
                        Text("😀")
                            .font(.system(size: size))
                            .offset(y: -80)
                            .onTapGesture {
                                size += 4
                                happinessIndex += 2
                            }
                            
                    }
                } else if happinessIndex >= 25 && happinessIndex < 40 {
                    ZStack{
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.red,
                                Color.orange,
                                Color.yellow,
                                Color.green,
                                Color.blue,
                                Color.purple
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                                .edgesIgnoringSafeArea(.all)
                        
                        Image(systemName: "teddybear.fill")
                            .resizable()
                            .scaledToFit()
                        
                        Text("🤩")
                            .font(.system(size: size))
                            .offset(y: -80)
                            .onTapGesture {
                                size += 4
                                happinessIndex += 2
                            }
                    }
                } else if happinessIndex >= 40 && happinessIndex < 50 {
                    ZStack{
                        RadialGradient(
                                    gradient: Gradient(colors: [
                                        Color.red,
                                        Color.yellow,
                                        Color.green,
                                        Color.blue
                                    ]),
                                    center: UnitPoint(x: 0.5, y: 0.6),
                                    startRadius: 0,
                                    endRadius: 450
                                )
                                .edgesIgnoringSafeArea(.all)
                                
                        
                        Image(systemName: "teddybear.fill")
                            .resizable()
                            .scaledToFit()
                        
                        Text("🥳")
                            .font(.system(size: size))
                            .offset(y: -80)
                            .onTapGesture {
                                size += 4
                                happinessIndex += 2
                            }
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
                    if happinessIndex > 50 {
                           happinessIndex = 0
                           print ("Restart Happiness Level")
                   }
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
                    }
                    if index == compliments.count {
                        index = 0
                        print("Restarted")
                    }
                    showAlert = true
                   
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
            
            //EmojiView
           
            
            VStack{
                
            
            }
            

           
            
            .tabItem {
            Label("Emoji Game", systemImage: "gamecontroller.fill")
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
