//
//  ContentView.swift
//  TransitionsSwiftUI
//
//  Created by sss on 12.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isAlertShow = false
    
    var body: some View {
        
        ZStack (alignment: .top){
            
            Color("background")
            HStack {
                Text("Transitions")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                questionMarkView
            }
            .blur(radius: isAlertShow ? 10: 0)
            .padding()
            
            if isAlertShow {
                alertView
                   
                    //.transition(AnyTransition.slide)
                    //.transition(AnyTransition.move(edge: .bottom))
                    //.transition(.offset(x: 200, y: -200))
                    //.transition(.opacity)
                    //.transition(.scale)
                    //.transition(.slide.combined(with: .scale).combined(with: .opacity))
                    //.transition(.move(edge: .trailing).combined(with: .scale(scale: 0.1, anchor: .topTrailing)))
                    .transition(.asymmetric(insertion: .slide, removal: .move(edge: .bottom)))
                    .zIndex(1)
            }
        }
        
    }
    
    var questionMarkView: some View {
        Button {
            withAnimation {
                isAlertShow.toggle()
            }
        } label: {
            Image(systemName: "questionmark.circle.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(Color("action"))
        }

    }
    
    var alertView: some View {
        VStack(spacing: 20) {
            Text("The documents copied")
                .foregroundColor(.white)
            Image(systemName: "questionmark.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                
            Button("Cancel") {
                withAnimation {
                    isAlertShow.toggle()
                }
            }.foregroundColor(Color("action"))
        }
        .padding(35)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color("alert")))
        .padding(.top, 100)
        .shadow(radius: 15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
