//
//  ContentView.swift
//  LoveIslandWeek7
//
//  Created by Daniel Tackie on 5/1/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAnimating = false
    @State private var txtValue: String = ""
    @State private var txtValue2: String = ""
    @State private var angle: Double = 0
    @State private var fillAmount: CGFloat = 0
    @State private var percentage: Int = 0
    @State private var progressBar = false
    @State private var results: Int?
    
    var messages: String {
        switch percentage {
        case 0..<15:
            return "\(txtValue) and \(txtValue2) sitting in a tree..."
        case 15..<30:
            return "K-I-S-S-I-N-G 🤣"
        case 30..<45:
            return"\(txtValue2) loves \(txtValue)..🥰"
        case 45..<60:
            return"\(txtValue2) loves \(txtValue) not...😔"
        case 60..<75:
            return"\(txtValue2) loves \(txtValue)..🥰"
        case 75..<90:
            return"\(txtValue2) loves \(txtValue) not...😔"
        case 90..<100:
            return "The results are in!"
        default:
            return ""

        }
            
            
        }
    
    
    
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
                
                if !progressBar {
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
                            progressBar = true
                            withAnimation(.easeOut(duration: 10)) {
                                fillAmount = 1
                                angle += 360
                            }
                            Timer.scheduledTimer(withTimeInterval: 0.085, repeats: true) {timer in
                                if percentage < 100 {
                                    percentage += 1
                                } else {
                                    timer.invalidate()
                                    results = Int.random(in: 0...100)
                                }
                            }
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
                    
                } else {
                    VStack {
                        Spacer().frame(height: 100)
                        if percentage < 100{
                            ZStack {
                                Circle()
                                    .stroke(lineWidth: 15)
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.gray.opacity(0.3))
                                Circle()
                                    .trim(from: 0, to: fillAmount)
                                    .stroke(style: StrokeStyle(lineWidth: 18, lineCap: .round, lineJoin: .round))
                                    .frame(width: 150, height: 150)
                                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.purple, .pink]), startPoint: .top, endPoint: .bottom))
                                    .rotationEffect(.degrees( -90))
                                
                                Text("\(percentage)\(Text("%").font(.title3))").font(.largeTitle).monospacedDigit()
                                    .bold()
                                    .foregroundColor(.white)
                                
                            }
                            
                            VStack {
                                Spacer().frame(height:120)
                                Text(messages)
                                    .font(.system(size: 20, weight: .bold, design: .serif))
                                    .foregroundColor(.white)
                            }
                            
                        }  else if let results {
                            Text("\(txtValue) and \(txtValue2) are")
                                .font(.system(size: 20, weight: .bold, design: .serif))
                                .foregroundColor(.white)
                            Text("\(results)%")
                                .font(.system(size: 60, weight: .bold))
                                .monospacedDigit()
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                                .transition(.opacity)
                            Text("Compatible")
                                .font(.system(size: 20, weight: .bold, design: .serif))
                                .foregroundColor(.white)
                            ZStack {
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(AngularGradient(colors: [.teal, .orange, .teal], center: .center, angle: .degrees(isAnimating ? 360 : 0)))
                                    .frame(width: 260, height: 60)
                                    .blur(radius: 6)
                                
                                
                                Button(action:{
                                    percentage = 0
                                    fillAmount = 0
                                    progressBar = false
                                    txtValue = ""
                                    txtValue2 = ""
                                }) {
                                    
                                    Text("PLAY AGAIN")
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
                                
                            }
                            
                            
                            
                        }
                    }
                    Spacer()
                    
                }
                
                
            }
            
        }
    }
                
            
            
            
            
            
        
        
    
    
    
    
    
    

    
    
    #Preview {
        ContentView()
    }
    
    

    


// Get User's name(Done)
// Get crushes name(Done)
// Progress bar pops up and loads to 100% with animation(Done)
// While progress bar loads small message come under progress bar such as "User & Crush sitting in a tree.." and "Crush loves me.. Crush loves me not.(Done)
// randomly generated number stating the user and crushes compatibilty(Done)

