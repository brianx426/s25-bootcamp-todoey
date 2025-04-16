//
//  TodoRowView.swift
//  todoey
//
//  Created by Brian Liu on 3/14/25.
//

import SwiftUI

struct TodoRowView : View {
  @Binding var todo: Todo
  @Binding var color: Color
  
  var body: some View {
    Button {
      todo.isDone.toggle()
    } label: {
        HStack {
          Image(systemName: todo.isDone ? "circle.fill" : "circle")
            .foregroundStyle(color)
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
}
