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
