/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 20/07/2023
  Last modified: 05/08/2023
  Acknowledgement: https://github.com/TomHuynhSG/SSET-Contact-List-iOS/blob/main/ContactList/Views/MapView.swift
*/
import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion()

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [Pin(coordinate: coordinate)]) { pin in
            MapMarker(coordinate: pin.coordinate)
        }
        .onAppear {
            setRegion(coordinate)
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06)
        )
    }
}

// Pinpoint the coordination
struct Pin: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 1.3644, longitude: 103.9915))
    }
}


