//
//  ContentView.swift
//  TodoApp
//
//  Created by Sarah Haddix on 3/8/24.
//

/// Plan:
/// home screen - implement empty screen
/// home screen - button at bottom that lets you make "new page"
/// home screen - displays all pages as navigation links of custom views: contains color and name
///
/// page - implement empty screen
/// all in custom view's color
/// page - button at the bottom that lets you make a new task
/// figure out how to implement delete feature
/// figure out how to implement number feature

import SwiftUI

struct ContentView: View {
    @State private var allPages: [PageView] = []
    
    private var colors: [Color] = [.blue, .green, .pink, .purple]
    @State private var colorIndex: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Reminders")
                        .font(.largeTitle)
                        .bold()
                        .padding(.horizontal)
                    Spacer()
                }
                .padding()
                
                ForEach(allPages) { page in
                    
                    page
                        .padding()
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                }
                
                Spacer()
                
                HStack {
                    Button {
                        allPages.append(PageView(name: "", color: colors[colorIndex%4]))
                        colorIndex+=1
                        
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle")
                                .padding(.leading)
                            Text("New Page")
                        }
                }
                    .padding()
                    Spacer()
                }
            }
        }
    }
}

// Each page view connected to a PageDetailView
struct PageView: View, Identifiable {
    let id = UUID()
    @State var name: String
    @State var color: Color
    
    @State var todos: [String] = []
    
    var initDisplay: String {
        if name == "" {
            return "Page Name"
        }
        return name
    }
    
    var body: some View {
        NavigationStack {
            HStack {
                Image(systemName: "list.bullet.circle")
                    .font(.title2)
                TextField("\(initDisplay)", text: $name)
                    .padding(.horizontal)
                Text("\(todos.count)")
                    .padding(.horizontal)
                
                NavigationLink(destination: {
                    PageDetailView(color: color, name: name, todos: $todos)
                }, label: {
                    Image(systemName: "chevron.right")
                })
            }
            .padding(.horizontal)
            .foregroundStyle(color)
        }
    }
}

struct PageDetailView: View, Identifiable {
    let id = UUID()
    var color: Color
    var name: String
    
    @Binding var todos: [String]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("\(name)")
                        .font(.largeTitle)
                        .foregroundStyle(color)
                        .bold()
                        .padding(.horizontal)
                    Spacer()
                }
                .padding()
                
                ForEach($todos, id: \.self) { $todo in
                    TodoView(name: $todo)
                        .padding()
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                }
                
                Spacer()
                
                HStack {
                    Button {
                        todos.append("")
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle")
                                .padding(.leading)
                            Text("New TODO")
                        }
                }
                    .padding()
                    Spacer()
                }
            }
        }
    }
}

struct TodoView: View {
    @Binding var name: String
    
    var initDisplay: String {
        if name == "" {
            return "What do you need to do?"
        }
        return name
    }
    
    var body: some View {
        NavigationStack {
            HStack {
                Image(systemName: "circle")
                    .font(.title2)
                TextField("\(initDisplay)", text: $name)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ContentView()
}
 
