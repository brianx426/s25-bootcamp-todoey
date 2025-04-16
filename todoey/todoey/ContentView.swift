//
//  ContentView.swift
//  todoey
//
//  Created by Brian Liu on 2/22/25.
//

import SwiftUI

struct Todo: Identifiable {
    var id = UUID()
    var item: String
    var isDone: Bool
}

struct ContentView: View {
  @State private var todos: [Todo] = []
  @State private var isPresented: Bool = false
  @State private var title: String = "Todoey"
  @State private var color: Color = .yellow
    
  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()
    VStack(alignment: .leading) {
      HStack {
        Text(title)
          .font(.largeTitle)
          .fontWeight(.bold)
          .foregroundStyle(color)
        
        Spacer()
        
        Button {
          isPresented.toggle()
        } label: {
          Image(systemName: "info.circle")
            .resizable()
            .frame(width: 30, height: 30)
            .foregroundStyle(color)
        }
        .sheet(isPresented: $isPresented) {
          InfoView(title: $title, color: $color)
            .presentationBackground(Color.black)
        }
      }
      .padding(.horizontal)
      
    
      List {
        ForEach($todos) { $todo in
          TodoRowView(todo: $todo, color: $color)
          }
          .onDelete { indexSet in
            for index in indexSet {
              let todoToDelete = todos[index]
              todos.removeAll { $0.id == todoToDelete.id }
            }
          }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
      
        Button {
          todos.append(Todo(id: UUID(), item: "", isDone: false))
        } label: {
            HStack {
              Image(systemName: "plus.circle.fill")
                .foregroundStyle(color)
              Text("New Reminder")
                .foregroundStyle(color)
                .font(.title2)
                .fontWeight(.bold)
          }
          .padding(.leading)
        }
      }
    }
  }
}


#Preview {
  ContentView()
}
