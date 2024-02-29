//
//  ContentView.swift
//  SpotifyUI
//
//  Created by Sarah Haddix on 2/28/24.
//

/// Questions: I tried to make the code work on any screensize using information I found at: https://designcode.io/swiftui-handbook-detect-screen-size. I'm not like 100% sure how it works so just let me know if you're supposed to do this differently.

//TODO: Array of different song structs each with color, picture, name, artist, changes on fast-forward click
//TODO: Make name scrolling if it doesn't fit
//TODO: add to questions page - does group wrapper work differenly with applying modifiers than say, HStack. How to override a modifier?

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                VStack {
                    HStack {
                        Group {
                            Image(systemName: "chevron.down")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18, height: 18)
                                .foregroundStyle(.white)
                            Spacer()
                            Text("\"common people\" in Search")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .fontWeight(.bold)
                            Spacer()
                            Image(systemName: "ellipsis")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18, height: 18)
                                .foregroundStyle(.white)
                        }
                    }
                    .padding(.horizontal, proxy.size.width/17)
                    Spacer()
                    Image("commonPeopleCover")
                        .resizable()
                        .scaledToFit()
                        .frame(width: proxy.size.width * (15/17))
                        .clipShape(RoundedRectangle(cornerRadius: 9))
                    Spacer()
                    HStack {
                        VStack {
                            Text("Common People - Full")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("Pulp")
                                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fontWeight(.semibold)
                        }
                        Spacer()
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                    .foregroundStyle(.white)
                    .padding(.horizontal, proxy.size.width/17)
                    
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: proxy.size.width * (15/17), height: 5)
                            .cornerRadius(2.5)
                        HStack {
                            Rectangle()
                                .fill(.white)
                                .frame(width: proxy.size.width * (5/17), height: 5)
                                .cornerRadius(2.5)
                                .padding(.horizontal, proxy.size.width/17)
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 13, height: 13)
                                .foregroundStyle(.white)
                                .padding(.horizontal, proxy.size.width * (6/17))
                            Spacer()
                        }
                    }
                    
                    HStack {
                        Text("2:01")
                        Spacer()
                        Text("3:50")
                    }
                    .foregroundStyle(.white)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                    .font(.caption)
                    .padding(.horizontal, proxy.size.width/17)
                    
                    HStack {
                        Image(systemName: "shuffle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: proxy.size.width * (0.07))
                        Spacer()
                        Image(systemName: "backward.end.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: proxy.size.width * (0.06))
                        Spacer()
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: proxy.size.width * (0.15))
                        Spacer()
                        Image(systemName: "forward.end.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: proxy.size.width * (0.06))
                        Spacer()
                        Image(systemName: "repeat")
                            .resizable()
                            .scaledToFit()
                            .frame(width: proxy.size.width * (0.07))
                    }
                    .foregroundStyle(.white)
                    .padding(.horizontal, proxy.size.width/17)
                    .padding(.vertical, proxy.size.width/28)
                    
                    HStack {
                        Image(systemName: "hifispeaker.2")
                        Group {
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                        Image(systemName: "square.and.arrow.up")
                        Spacer()
                        Image(systemName: "list.bullet")
                    }
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .padding(.horizontal, proxy.size.width/17)
                    
                }
                .padding(.vertical)
                .frame(width: proxy.size.width, height: proxy.size.height)
                    .background(LinearGradient(gradient: Gradient(colors: [.brown1, .brown2]), startPoint: .topLeading, endPoint: .bottomTrailing))
            }
        }
    }
}

#Preview {
    ContentView()
}
