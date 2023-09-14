//
//  ContentView.swift
//  Animation
//
//  Created by Alexey Turulin on 8/5/23.
//

import SwiftUI



struct ContentView: View {
    @State private var animationStarted = false
    @State private var isAnimationLinear = false
    
    var foreverLinearAnimation: Animation {
        Animation.linear(duration: Double.random(in: 2...20))
            .repeatForever(autoreverses: false)
    }
    
    var foreverSpringAnimation: Animation {
        Animation.spring(
            response: Double.random(in: 0...2),
            dampingFraction: Double.random(in: 0...2),
            blendDuration: Double.random(in: 0...2))
        .repeatForever(autoreverses: true)
    }
    
    var body: some View {
        VStack {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                
                HStack {
                    ForEach(0..<22) { _ in
                        ZStack {
                            ForEach(0..<100) { _ in
                                let height = UIScreen.main.bounds.height
                                
                                if isAnimationLinear {
                                    RandomElementView()
                                        .offset(y: animationStarted ?  height / 2 : -height / 2 - 25)
                                        .opacity(Double.random(in: 0.1...1))
                                        .animation(foreverLinearAnimation, value: animationStarted)
                                } else {
                                    RandomElementView()
                                        .offset(y: animationStarted ?  height / 2 : -height / 2 - 25)
                                        .opacity(Double.random(in: 0.1...1))
                                        .animation(foreverSpringAnimation, value: animationStarted)
                                }
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            animationStarted.toggle()
        }
        .onTapGesture {
            isAnimationLinear.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RandomElementView: View {
    var body: some View {
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        Text(String(characters.randomElement() ?? " "))
//        Image(systemName: "star")
            .scaledToFill()
            .foregroundColor(.green)
    }
}
