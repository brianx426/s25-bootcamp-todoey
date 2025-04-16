//
//  InfoView.swift
//  todoey
//
//  Created by Brian Liu on 3/14/25.
//

import SwiftUI

struct InfoView : View {
  @Environment(\.dismiss) var dismiss
  @Binding var title: String
  @Binding var color: Color
  var body: some View {
    ZStack {
      Color("SheetGray").ignoresSafeArea()
      
      VStack {
        VStack(alignment: .center, spacing: 8) {
          Image(systemName: "list.bullet.circle.fill")
            .resizable()
            .frame(width: 90, height: 90)
            .foregroundStyle(color == .white ? .black : .white, color)
            .padding(.vertical)
          TextField("", text: $title)
            .foregroundStyle(color)
            .padding()
            .background(Color("TextGray"))
            .clipShape(RoundedRectangle(cornerRadius: 12.5))
            .font(.title2)
            .bold()
            .overlay(
              Text("Title")
                .foregroundStyle(Color("PlaceholderColor"))
                .opacity(title.isEmpty ? 1 : 0)
                .padding(.leading, 18), alignment: .leading
            )
            .padding(.horizontal)
            .padding(.bottom)
        }
        .background(Color("BoxGray"))
        .clipShape(RoundedRectangle(cornerRadius: 12.5))
        .padding(.horizontal)
        
        VStack {
          let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .indigo, .purple, Color("LightBlue"), .white]
          
          let columns = Array(repeating: GridItem(.flexible()), count: 6)
          
          LazyVGrid(columns: columns, spacing: 20) {
            ForEach(colors, id: \.self) { color in
              Button {
                self.color = color
              } label: {
                Circle()
                  .fill(color)
                  .frame(width: 40, height: 40)
              }
            }
          }
          .padding()
          
        }
        .background(Color("BoxGray"))
        .clipShape(RoundedRectangle(cornerRadius: 12.5))
        .padding(.horizontal)
        .padding(.top)
      }
    }
  }
  
}
