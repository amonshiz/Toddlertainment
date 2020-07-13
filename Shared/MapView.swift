//
//  MapView.swift
//  Toddlertainment
//
//  Created by Andrew Monshizadeh on 7/13/20.
//

import SwiftUI
import MapKit

private struct MapViewImplementation<Context> {
  let points: [PointOfInterest]

  init(_ points: [PointOfInterest] = []) {
    self.points = points
  }

  func makeView(context: Context) -> MKMapView {
    let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.742218, longitude: -74.032312), latitudinalMeters: 3500, longitudinalMeters: 500)
    let view = MKMapView(frame: .zero)
    view.setRegion(region, animated: false)

    view.addAnnotations(points.map({ poi in
      let annotation = MKPointAnnotation()
      annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(poi.coordinate.x), longitude: CLLocationDegrees(poi.coordinate.y))
      return annotation
    }))

    return view
  }

  func updateView(_ uiView: MKMapView, context: Context) {
  }
}

#if os(iOS)

struct MapView: UIViewRepresentable {
  fileprivate let impl: MapViewImplementation<UIViewRepresentableContext<Self>>

  init(_ points: [PointOfInterest] = []) {
    impl = MapViewImplementation<UIViewRepresentableContext<Self>>(points)
  }

  func makeUIView(context: Context) -> MKMapView {
    impl.makeView(context: context)
  }

  func updateUIView(_ uiView: MKMapView, context: Context) {
    impl.updateView(uiView, context: context)
  }
}

#elseif os(macOS)

struct MapView: NSViewRepresentable {
  fileprivate let impl: MapViewImplementation<NSViewRepresentableContext<Self>>

  init(_ points: [PointOfInterest] = []) {
    impl = MapViewImplementation<NSViewRepresentableContext<Self>>(points)
  }

  func makeNSView(context: Context) -> MKMapView {
    impl.makeView(context: context)
  }

  func updateNSView(_ nsView: MKMapView, context: Context) {
    impl.updateView(nsView, context: context)
  }
}

#endif

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
          .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
