//
//  PetView.swift
//  Quirky Compliments Make Me Happy!!!
//
//  Created by RGS on 24/6/23.
//

import SwiftUI

struct PetView: View {
    
@State private var happinessIndex = 0
    
    var body: some View {
        VStack{
            Text("Happiness level: \(happinessIndex) / 100")
            Image(systemName: "teddybear.fill")
                .resizable()
                .scaledToFit()
         //   if isPositiveFeedback = true

  
            
            
            
            
            //CLosing for VStack
        }
        
            
    }
}

struct PetView_Previews: PreviewProvider {
    static var previews: some View {
        PetView()
    }
}
