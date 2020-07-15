//
//  LocationsListView.swift
//  Toddlertainment
//
//  Created by Andrew Monshizadeh on 7/15/20.
//

import SwiftUI

struct PointsOfInterestListView: View {
  let pointsOfInterest: [PointOfInterest]

  var body: some View {
    List {
      ForEach(pointsOfInterest) {
        NavigationLink($0.name, destination: PointOfInterestDetailView($0.id))
      }
    }
    .navigationTitle("Locations")
  }
}

struct LocationsListView_Previews: PreviewProvider {
  static var previews: some View {
    PointsOfInterestListView(pointsOfInterest: GlobalPointsOfInterest)
  }
}
