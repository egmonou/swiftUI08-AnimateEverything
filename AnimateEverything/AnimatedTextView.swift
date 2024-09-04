//
//  ContentView.swift
//  AnimateEverything
//
//  Created by administrator on 03/09/2024.
//

import SwiftUI

struct AnimatedTextView: View {
    let text = "Hellow Worlds!"
    @State var offSet:CGSize = CGSize(width: 0, height: 1000)
    @State var togglePostion = false
    @State var cColor: Color = .red

    var body: some View {
        VStack {
            Text(text)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.semibold)
                .offset(offSet)
                .foregroundColor(cColor)
            
            Spacer()
            
            Button(action: {
                withAnimation(.spring()){
                    offSet.height = togglePostion ? 400 : 0
                    cColor = togglePostion ? .red : .blue
                    togglePostion.toggle()
                }
            }
            ,label: {
                Text("Animate")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .overlay(Capsule().stroke())
            })
            
        }
        .padding()
        .onAppear {
            withAnimation(.easeIn(duration: 1)) {
                offSet = .zero
            }
        }
    }
}

#Preview {
    AnimatedTextView()
}
