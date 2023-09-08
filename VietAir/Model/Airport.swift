/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 31/07/2023
  Last modified: 05/08/2023
  Acknowledgement: None
*/

import Foundation
import SwiftUI
import CoreLocation

struct Airport: Identifiable, Codable{
    var id: Int
    var name: String
    var iataCode: String
    var globalRanking: Int
    var regionalRanking: Int
    var country: String
    var city: String
    var region: String
    var numberOfTerminals: Int
    var numberOfRunways: Int
    var rating: Float
    var review: Int
    var overview: String
    var address: String
    var timeIdentifier: String

    var imageName: [String]
    
    
    
    var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    var destinations: [Destination]
}

struct Destination: Codable, Identifiable {
    let id: String
    let destName: String
    let destImage: String
    let description: String
}


struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
}
