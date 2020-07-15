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
}

extension PointOfInterest: Identifiable {
  var id: String { name + "\(coordinate.latitude)\(coordinate.longitude)"}
}

let GlobalPointsOfInterest = [
  PointOfInterest(name: "Church Square Park", coordinate: CLLocationCoordinate2D(latitude: 40.742200, longitude: -74.032387), description: "A park across the street from a church"),
  PointOfInterest(name: "Steven's Park", coordinate: CLLocationCoordinate2D(latitude: 40.741468, longitude: -74.028031), description: nil),
]


