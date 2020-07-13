//
//  ContentView.swift
//  Shared
//
//  Created by Andrew Monshizadeh on 7/13/20.
//

import SwiftUI
import MapKit

struct ContentView: View {
  @State var isPresented = false

  let pointsOfInterest = [
    PointOfInterest(name: "Church Square Park", coordinate: CLLocationCoordinate2D(latitude: 40.742200, longitude: -74.032387), description: nil),
    PointOfInterest(name: "Steven's Park", coordinate: CLLocationCoordinate2D(latitude: 40.741468, longitude: -74.028031), description: nil),
  ]

  var body: some View {
    NavigationView {
      MapView(pointsOfInterest)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .navigationBarItems(
          leading:
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
        )
    }
    .sheet(isPresented: $isPresented) {
      NavigationView {
        List {
          ForEach(pointsOfInterest, id: \.name) {
            Text("\($0.name)")
          }
        }
        .navigationTitle("Locations")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
