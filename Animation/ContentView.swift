//
//  ContentView.swift
//  Animation
//
//  Created by Alexey Turulin on 8/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationStarted = false
    
    var foreverAnimation: Animation {
        Animation.linear(duration: Double.random(in: 1...10))
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        VStack {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                
                HStack {
                    ForEach(0..<30) { _ in
                        VStack {
                            ForEach(0..<200) { _ in
                                RandomElementView()
                                    .offset(y: animationStarted ?  0 : -1000)
                                    .opacity(Double.random(in: 0.1...1))
                                    .animation(foreverAnimation, value: animationStarted)
                            }
                        }
                    }
                }
            }
        }
        .onTapGesture {
            animationStarted.toggle()
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
            .frame(width: 10)
            .foregroundColor(.green)
    }
}
