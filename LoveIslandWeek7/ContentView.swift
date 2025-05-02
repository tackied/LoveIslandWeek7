//
//  ContentView.swift
//  LoveIslandWeek7
//
//  Created by Daniel Tackie on 5/1/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAnimating = false
    @State  var txtValue: String = ""
    @State  var txtValue2: String = ""
    
    
    var body: some View {
        ZStack {
            Image("IMG_1570")
            //Image("Love Genie0")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer().frame(height: 12)
                Text("Love Genie")
                    .font(.system(size: 60, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                Text("Compatibilty Checker")
                    .font(.system(size: 20, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                Spacer()
                
              
            //User inputs for names
                TextField("What's your name?", text: $txtValue)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .frame(maxWidth: 350)
                
                TextField("What's the name of your crush?", text: $txtValue2)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .frame(maxWidth: 350)
            
                

                
                Spacer().frame(height:120)
                

                
                
                

            // Submit button
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(AngularGradient(colors: [.teal, .orange, .teal], center: .center, angle: .degrees(isAnimating ? 360 : 0)))
                    .frame(width: 260, height: 60)
                    .blur(radius: 6)
                
                
                
                
                Button(action:{
                 //   let name = self.txtValue
                   // let crush = self.txtValue2
                    
                    
                    
                }) {
                    
                    Text("ASK THE GENIE")
                        .bold()
                        .font(.title3)
                        .fontDesign(.serif)
                        .foregroundStyle(.orange)
                        .frame(width: 260, height: 60)
                        .background(Color.white, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .overlay {
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .stroke(.gray.opacity(0.5), lineWidth: 1)
                        }
                }
            }
            .onAppear {
                withAnimation(Animation.linear(duration: 7).repeatForever(autoreverses: false)) {
                    isAnimating = true
                }
                
            }
                Spacer().frame(height:150)
            
        }
        
        
        
        
    }
    
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
//    #Preview {
//        ContentView()

// Get User's name
// Get crushes name
// Progress bar pops up and loads to 100% with animation
// While progress bar loads small message come under progress bar such as "User & Crush sitting in a tree.." and "Crush loves me.. Crush loves me not.
// randomly generated number stating the user and crushes compatibilty

