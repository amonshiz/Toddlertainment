//
//  RootMapView.swift
//  Toddlertainment
//
//  Created by Andrew Monshizadeh on 7/15/20.
//

import SwiftUI
import MapKit

struct RootMapView: View {
  class State: ObservableObject {
    @Published var isPresented = false
    @Published var selectedPointOfInterest: PointOfInterest?
  }


  @Binding var coordinateRegion: MKCoordinateRegion
  let pointsOfInterest: [PointOfInterest]

  @ObservedObject var state: State
  
  var body: some View {
    Map(coordinateRegion: $coordinateRegion, interactionModes: [], showsUserLocation: false, userTrackingMode: nil, annotationItems: pointsOfInterest) { poi in
      MapAnnotation(coordinate: poi.coordinate) {
        Image(systemName: "bus")
          .padding(5)
          .onTapGesture {
            state.selectedPointOfInterest = poi
            state.isPresented.toggle()
          }
          .background(
            RoundedRectangle(cornerRadius: 5)
              .fill()
              .foregroundColor(.red))
      }
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
}

struct RootMapView_Previews: PreviewProvider {
  @State static var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.742218, longitude: -74.032312), latitudinalMeters: 3500, longitudinalMeters: 500)

  static var previews: some View {
    RootMapView(coordinateRegion: $coordinateRegion, pointsOfInterest: GlobalPointsOfInterest, state: RootMapView.State())
  }
}
