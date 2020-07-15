//
//  ContentView.swift
//  Shared
//
//  Created by Andrew Monshizadeh on 7/13/20.
//

import SwiftUI
import MapKit

struct ContentView: View {
  @ObservedObject private var state = RootMapView.State()

  @State var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.742218, longitude: -74.032312), latitudinalMeters: 3500, longitudinalMeters: 500)

  let pointsOfInterest: [PointOfInterest]

  var body: some View {
    NavigationView {
      RootMapView(coordinateRegion: $coordinateRegion, pointsOfInterest: pointsOfInterest, state: state)
    }
    .sheet(isPresented: $state.isPresented, onDismiss: {
      state.selectedPointOfInterest = nil
    }) {
      NavigationView {
        if let poi = state.selectedPointOfInterest {
          PointOfInterestDetailView(poi.id)
            .navigationTitle(poi.name)
        } else {
          PointsOfInterestListView(pointsOfInterest: pointsOfInterest)
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(pointsOfInterest: GlobalPointsOfInterest)
  }
}
