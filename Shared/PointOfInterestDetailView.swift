//
//  PointOfInterestDetailView.swift
//  Toddlertainment
//
//  Created by Andrew Monshizadeh on 7/13/20.
//

import SwiftUI
import MapKit

struct PointOfInterestDetailView: View {
  let details: PointOfInterestDetails

  @State var coordinateRegion: MKCoordinateRegion
  let mapping = GlobalPointsOfInterestDetails

  init(_ pointOfInterestID: UUID) {
    guard let details = mapping[pointOfInterestID] else { fatalError() }

    self.details = details
    _coordinateRegion = State<MKCoordinateRegion>(initialValue:  MKCoordinateRegion(center: details.baseProperties.coordinate, latitudinalMeters: 150, longitudinalMeters: 150))
  }

  var body: some View {
    GeometryReader { geo in
      VStack {
        Map(coordinateRegion: $coordinateRegion, interactionModes: [], showsUserLocation: false, annotationItems: [details.baseProperties]) { poi in
          MapPin(coordinate: poi.coordinate)
        }
          .frame(width: nil, height: geo.size.height * 0.25, alignment: .top)
        if let detail = details.baseProperties.description {
          Text(detail)
        }
        Spacer()
      }
    }
    .edgesIgnoringSafeArea([.top])
    .navigationTitle(details.baseProperties.name)
  }
}

struct PointOfInterestDetailView_Previews: PreviewProvider {
  static var previews: some View {
    PointOfInterestDetailView(GlobalPointsOfInterest[0].uuid)
  }
}
