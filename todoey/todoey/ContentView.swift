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
    
    var body: some View {
      ZStack {
        Color.black.ignoresSafeArea()
    VStack(alignment: .leading) {
      Text("Todoey")
        .font(.largeTitle)
        .fontWeight(.bold)
        .foregroundStyle(.yellow)
        .padding(.leading)
    
      List {
        ForEach($todos) { $todo in
          Button {
            todo.isDone.toggle()
          } label: {
              HStack {
                Image(systemName: todo.isDone ? "circle.fill" : "circle")
                  .foregroundStyle(.yellow)
                TextField("", text: $todo.item)
                  .textFieldStyle(PlainTextFieldStyle())
                  .font(.title2)
                  .foregroundStyle(todo.isDone ? Color.gray : Color.white)
              }
              .padding(.vertical, 8)
            }
            .listRowBackground(Color.black)
            .listRowSeparatorTint(.white)
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
                .foregroundStyle(.yellow)
              Text("New Reminder")
                .foregroundStyle(.yellow)
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
