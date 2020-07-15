//
//  PointOfInterest.swift
//  Toddlertainment
//
//  Created by Andrew Monshizadeh on 7/13/20.
//

import Foundation
import CoreLocation

struct PointOfInterest {
  let name: String
  let coordinate: CLLocationCoordinate2D
  let description: String?

  let uuid = UUID()
}

extension PointOfInterest: Identifiable {
  var id: UUID { uuid }
}

struct PointOfInterestDetails {
  enum Kind {
    case construction
    case trains

    var textDescription: String {
      switch(self) {
        case .construction: return "Construction"
        case .trains: return "Trains"
      }
    }
  }

  struct Detail {
    let information: String
  }

  let baseProperties: PointOfInterest
  let kind: Kind

  let details: [Detail]
}

let GlobalPointsOfInterest = [
  PointOfInterest(name: "Church Square Park", coordinate: CLLocationCoordinate2D(latitude: 40.742200, longitude: -74.032387), description: "A park across the street from a church"),
  PointOfInterest(name: "Steven's Park", coordinate: CLLocationCoordinate2D(latitude: 40.741468, longitude: -74.028031), description: nil),
]

let GlobalPointsOfInterestDetails = [
  GlobalPointsOfInterest[0].uuid:
    PointOfInterestDetails(
      baseProperties: GlobalPointsOfInterest[0],
      kind: .construction,
      details: [
        PointOfInterestDetails.Detail(information: "5 Cement Mixers"),
        PointOfInterestDetails.Detail(information: "2 Skid Steers"),
        PointOfInterestDetails.Detail(information: "1 Excavator"),
      ]),
  GlobalPointsOfInterest[1].uuid:
    PointOfInterestDetails(
      baseProperties: GlobalPointsOfInterest[1],
      kind: .trains,
      details: [
        PointOfInterestDetails.Detail(information: "5 NJ Transit Trains"),
      ]),
]


