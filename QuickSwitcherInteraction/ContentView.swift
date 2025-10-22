//
//  ContentView.swift
//  QuickSwitcherInteraction
//
//  Created by Sanguo Joseph Ledoux on 10/21/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text : String = ""
    @State private var scaleEffect = 1.0
    @State private var promptIndex = 0
    
    let label = ["Ask Anything", "Generate Image", "Sumarize Document", "Translate Text", "Imagine"]
    let image = ["sparkle",  "photo.on.rectangle.angled", "book.pages", "translate", "lasso.badge.sparkles"]

    var prompt = "Ask Anything"
    var body: some View {
        NavigationStack {
            HStack(){
                Button{
                    
                } label : {
                    HStack(spacing:3){
                        Image(systemName: image[promptIndex])
                            .foregroundStyle(.black)
                            .contentTransition(.numericText())
                            .frame(width: 24)
                        Image(systemName: "chevron.up.chevron.down")
                            .foregroundStyle(.gray.opacity(0.7))
                            .font(.system(size: 14).weight(.bold))
                    }
                    .padding(.vertical, 15)
                    .padding(.horizontal,10)
                    .background(.white)
                    
                    .clipShape(.capsule)
                    .scaleEffect(scaleEffect)
                    .shadow(color:.black.opacity(0.1), radius: 1)
                    .onTapGesture {apGesture in
                        withAnimation(.bouncy){
                            scaleEffect = 0.85
                            
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.18){
                            withAnimation(.bouncy){
                                let count = label.count - 1
                                if promptIndex < count {
                                    promptIndex += 1
                                } else {
                                    promptIndex = 0
                                }
                                
                                scaleEffect = 1.0
                                
                            }
                        }
                        
                    }
                    
                    
                    
                }
                
                TextField("", text: $text,)
                    .tint(.black)
                    .fontWeight(.semibold)
                    .contentTransition(.numericText())
                    .overlay(
                        Text(label[promptIndex])
                            .offset(x:3.5)
                            .frame( maxWidth: .infinity,alignment: .leading)
                            .fontWeight(.semibold)
                            .contentTransition(.numericText())
                            .foregroundStyle(.gray.opacity(0.8))
                            .opacity(text.count == 0 ? 1 : 0)
                    )
                
                Button{
                    
                } label : {
                    HStack(spacing:3){
                        Image(systemName: "arrow.right")
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                    .padding(.vertical, 15)
                    .padding(.horizontal,15)
                    .background(.white)
                    
                    .clipShape(.circle)
                    .scaleEffect(1.1)
                    .shadow(color:.black.opacity(0.1), radius: 1)
                    
                    
                    
                    
                    
                }
                
            }
            .navigationTitle("Quick Switcher Interaction")
            .toolbarTitleDisplayMode(.inline)
            .padding(.vertical, 4)
            .padding(.horizontal, 4)
            .background(
                RoundedRectangle(cornerRadius: 28)
                
                    .foregroundStyle(.quinary.opacity(0.58))
            )
            .padding()
        }
            
    }
}

#Preview {
    ContentView()
}
