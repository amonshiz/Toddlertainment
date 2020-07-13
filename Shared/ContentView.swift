//
//  ContentView.swift
//  Shared
//
//  Created by Andrew Monshizadeh on 7/13/20.
//

import SwiftUI
import MapKit

struct ContentView: View {
  private class InternalState: ObservableObject {
    @Published var isPresented = false
    @Published var selectedPointOfInterest: PointOfInterest?
  }

  @ObservedObject private var state = InternalState()

  let pointsOfInterest = [
    PointOfInterest(name: "Church Square Park", coordinate: CLLocationCoordinate2D(latitude: 40.742200, longitude: -74.032387), description: "A park across the street from a church"),
    PointOfInterest(name: "Steven's Park", coordinate: CLLocationCoordinate2D(latitude: 40.741468, longitude: -74.028031), description: nil),
  ]

  var body: some View {
    NavigationView {
      MapView(pointsOfInterest) { poi in
        state.selectedPointOfInterest = poi
        state.isPresented.toggle()
      }
      .edgesIgnoringSafeArea(.all)
      .navigationBarItems(
        leading:
          Button {
            state.isPresented.toggle()
          } label: {
            Label("", systemImage: "line.horizontal.3")
              .labelStyle(IconOnlyLabelStyle())
          }
          .buttonStyle(BorderlessButtonStyle())
          .padding(.all, 10)
          .background(Color.white)
          .cornerRadius(5.0)
      )
    }
    .sheet(isPresented: $state.isPresented, onDismiss: {
      state.selectedPointOfInterest = nil
    }) {
      NavigationView {
        if let poi = state.selectedPointOfInterest {
          PointOfInterestDetailView(pointOfInterest: poi)
            .navigationTitle(poi.name)
        } else {
          List {
            ForEach(pointsOfInterest, id: \.name) {
              NavigationLink($0.name, destination: PointOfInterestDetailView(pointOfInterest: $0))
            }
          }
          .navigationTitle("Locations")
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
