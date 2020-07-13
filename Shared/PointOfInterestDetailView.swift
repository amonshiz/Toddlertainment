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

  var body: some View {
    GeometryReader { geo in
      VStack {
        MapView([pointOfInterest])
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
