//
//  ContentView.swift
//  Shared
//
//  Created by Andrew Monshizadeh on 7/13/20.
//

import SwiftUI

struct ContentView: View {
  @State var isPresented = false

  var body: some View {
    NavigationView {
      MapView()
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button {
              isPresented.toggle()
            } label: {
              Label("", systemImage: "line.horizontal.3")
                .labelStyle(IconOnlyLabelStyle())
            }
            .buttonStyle(BorderlessButtonStyle())
            .padding(.all, 10)
            .background(Color(UIColor.white))
            .cornerRadius(5.0)
          }
        }
    }
    .alert(isPresented: $isPresented) {
      Alert(title: Text("Hello world!"))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
