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
        Animation.linear(duration: Double.random(in: 2...20))
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
                            ForEach(0..<100) { _ in
                                RandomElementView()
                                    .offset(y: animationStarted ?  1000 : -1000)
                                    .opacity(Double.random(in: 0...1))
                                    .animation(foreverAnimation, value: animationStarted)
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .opacity(animationStarted ? 1 : 0)
            }
        }
        .onAppear {
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
        let element = Int.random(in: 0...9)
        Text("\(element)")
            .frame(width: 10)
            .foregroundColor(.green)
    }
}
