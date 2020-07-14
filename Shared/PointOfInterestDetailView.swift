//
//  PointOfInterestDetailView.swift
//  Toddlertainment
//
//  Created by Andrew Monshizadeh on 7/13/20.
//

import SwiftUI
import MapKit

struct PointOfInterestDetailView: View {
  let pointOfInterest: PointOfInterest

  @State var coordinateRegion: MKCoordinateRegion

  init(pointOfInterest: PointOfInterest) {
    self.pointOfInterest = pointOfInterest
    _coordinateRegion = State<MKCoordinateRegion>(initialValue:  MKCoordinateRegion(center: pointOfInterest.coordinate, latitudinalMeters: 150, longitudinalMeters: 150))
  }

  var body: some View {
    GeometryReader { geo in
      VStack {
        Map(coordinateRegion: $coordinateRegion, interactionModes: [], showsUserLocation: false, annotationItems: [pointOfInterest]) { poi in
          MapPin(coordinate: poi.coordinate)
        }
          .frame(width: nil, height: geo.size.height * 0.25, alignment: .top)
        if let detail = pointOfInterest.description {
          Text(detail)
        }
        Spacer()
      }
    }
    .edgesIgnoringSafeArea([.top])
    .navigationTitle(pointOfInterest.name)
  }
}

struct PointOfInterestDetailView_Previews: PreviewProvider {
  static var previews: some View {
    PointOfInterestDetailView(pointOfInterest:     PointOfInterest(name: "Church Square Park", coordinate: CLLocationCoordinate2D(latitude: 40.742200, longitude: -74.032387), description: "A park across the street from a church"))
  }
}
