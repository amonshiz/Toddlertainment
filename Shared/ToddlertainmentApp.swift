//
//  ToddlertainmentApp.swift
//  Shared
//
//  Created by Andrew Monshizadeh on 7/13/20.
//

import SwiftUI
import MapKit

@main
struct ToddlertainmentApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(pointsOfInterest: GlobalPointsOfInterest)
    }
  }
}
