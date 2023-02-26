//
//  ContentView.swift
//  Jokes
//
//  Created by Don Bouncy on 19/02/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var jc = JokesController()
    
    @State private var timer: Timer?
    @State private var isFlipped = false
    @State private var frontDegree = 0.0
    @State private var backDegree = 90.0
    @State private var durationAndDelay = 0.3
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Jokes Generator")
                    .font(.largeTitle.bold())
                
                Spacer()
                
                ZStack{
                    if  jc.isLoading{
                        ProgressView()
                    } else {
                        SetupView(jc: jc)
                            .rotation3DEffect(.degrees(frontDegree), axis: (x: 0, y: 1, z: 0))
                        PunchlineView(jc: jc)
                            .rotation3DEffect(.degrees(backDegree), axis: (x: 0, y: 1, z: 0))
                    }
                }
                .onTapGesture {
                    flipCard()
                }
                
                
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task{
                            await jc.fetchJoke()
                        }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                    
                }
            }
            .task{
                Task{
                    await jc.fetchJoke()
                }
            }
        }
    }
    
    func flipCard () {
            isFlipped = !isFlipped
            if isFlipped {
                withAnimation(.linear(duration: durationAndDelay)) {
                    backDegree = 90
                }
                withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                    frontDegree = 0
                }
            } else {
                withAnimation(.linear(duration: durationAndDelay)) {
                    frontDegree = -90
                }
                withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                    backDegree = 0
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
