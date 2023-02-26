//
//  PunchlineView.swift
//  Jokes
//
//  Created by Don Bouncy on 19/02/2023.
//

import SwiftUI

struct PunchlineView: View {
    @ObservedObject var jc: JokesController
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                
                Text("Punchline")
                    .font(.title3.bold())
                    .padding(.bottom)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text(jc.joke?.punchline ?? "")

                Spacer()
                Spacer()
                
                Text(jc.joke?.type.capitalized ?? "")
                    .padding(.bottom)
                    .font(.subheadline.bold())
                    .foregroundColor(.gray)
            }
            .padding()
        }
                .padding()
        .frame(width: 400, height: 500)
        .background(
            Rectangle()
                .fill(Color.white)
                .padding()
                .shadow(color: .black.opacity(0.1), radius: 8, x: -8, y: 8)
            
        )
    }
}

struct PunchlineView_Previews: PreviewProvider {
    static var previews: some View {
        PunchlineView(jc: JokesController())
    }
}
