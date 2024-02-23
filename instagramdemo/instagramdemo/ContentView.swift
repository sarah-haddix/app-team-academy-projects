//
//  ContentView.swift
//  instagramdemo
//
//  Created by Sarah Haddix on 2/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                HStack {
                    Image("cyberpunkdolphin")
                        .resizable()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 50, height: 50)
                    Text("Cyberpunk_Dolphin")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    Spacer()
                    Image(systemName: "ellipsis")
                        .resizable()
                        .aspectRatio(nil, contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .foregroundColor(.white)
                    
                }
                .padding(.horizontal, 8)
                Image("cyberpunkdolphin")
                    .resizable()
                    .frame(height: 400)
                    .scaledToFill()
                HStack {
                    //TODO: Simplify
                    //TODO: Fix spacing
                    Image(systemName: "heart")
                        .resizable()
                        .aspectRatio(nil, contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                        .padding(.trailing, 2)
                    Image(systemName: "message")
                        .resizable()
                        .aspectRatio(nil, contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                        .padding(.horizontal, 2)
                    Image(systemName: "paperplane")
                        .resizable()
                        .aspectRatio(nil, contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                        .padding(.horizontal, 2)
                    Spacer()
                    Image(systemName: "bookmark")
                        .resizable()
                        .aspectRatio(nil, contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                    
                }
                .padding(.horizontal, 8)
                //TODO: Fix spacing
                HStack{
                    VStack (alignment: .leading, content: {
                        Text("1,000,000 Likes")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding(.top, 8)
                        Text("**Cyberpunk_Dolphin** Tough match last night. ")
                            .foregroundStyle(.white)
                            .font(.footnote)
                            .padding(.vertical, 4)
                        Text("Last night")
                            .font(.caption)
                            .foregroundStyle(.white
                            )
                            .padding(.bottom, 8)
                    })
                    Spacer()
                }
                .padding(.horizontal, 8)
            }
        }
    }
}

#Preview {
    ContentView()
}
