/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 20/07/2023
  Last modified: 05/08/2023
  Acknowledgement:None
*/

import Foundation
import MapKit
import SwiftUI
import CoreLocation

struct AirportView: View {
    var airport: Airport
    @State private var currentTime: String = "" // Add a @State property to hold the current time
    @State private var isExpanded: Bool = false // Add a @State property to track the expansion state
    @State private var isMapViewPresented = false // Add a @State property to track the mode of the full-screen map
    @State private var isExploreCardViewPresented = false // Add a @State property to track if the explore card is tapped or not
    var body: some View {
            ZStack(alignment: .top) {
                GeometryReader { reader in
                    ZStack {
                        AnimatedMovingGradientBackgroundView()
                    }
                    
                    
                    VStack (alignment:.leading) {
                        // Scroll down
                        ScrollView (.vertical, showsIndicators: false) {
                            TabView() { // Use TabView with a binding to selectedImageIndex
                                    ForEach(airport.imageName.indices, id: \.self) { index in
                                        Image(airport.imageName[index])
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            
                                            .cornerRadius(5)
                                            .shadow(radius: 8)
                                            .tag(index) // Tag each image with its index
                                    }
                                }
                                .tabViewStyle(PageTabViewStyle())
                                .frame(minHeight: reader.size.height * 0.4)
                            
                            VStack (alignment:.leading, spacing: 8) {
                                // Display the name
                                VStack (alignment:.leading, spacing: 10) {
                                    Text(airport.name)
                                        .font(.system(size: 22))
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color("textColor"))
                                    
                                    // Display the local current time
                                    HStack {
                                        Image(systemName: "clock.fill")
                                        Text(currentTime)
                                            .font(.system(size: 20))
                                            .fontWeight(.medium)
                                    }
                                    
                                    // Show the rating and the stars
                                    HStack {
                                        StarsView(rating: airport.rating)
                                            .frame(width:100)
                                        
                                        Text(String(format: "%.1f", airport.rating) + " / 5 (\(airport.review) reviews)")
                                            .fontWeight(.medium)
                                            .font(.system(size:20))
                                    }
                                }
                                .padding(.horizontal,5)
                                
                                // Create a table to store info
                                LazyVGrid(columns: [
                                    GridItem(.flexible(), spacing: 0),
                                    GridItem(.flexible(), spacing: 0)
                                ], spacing: 0) {
                                    rowCell("IATA Code", airport.iataCode)
                                    rowCell("Region", airport.region)
                                    rowCell("Country", airport.country)
                                    rowCell("State/City", airport.city)
                                    if isExpanded {
                                        rowCell("Global Ranking", "#\(airport.globalRanking)")
                                        rowCell("Regional Ranking", "#\(airport.regionalRanking)")
                                        rowCell("Terminals", "\(airport.numberOfTerminals)")
                                        rowCell("Runways", "\(airport.numberOfRunways)")
                                    }
                                }
                                .padding(.vertical, 10)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 4)
                                
                                // The chevron points down initially and reverse if the table had been expanded
                                CircleButton(image: "chevron.down.circle.fill")
                                    .rotationEffect(isExpanded ? .degrees(180) : .degrees(0))
                                    .offset(x: reader.size.width / 2 - 20, y: -18) // Adjust the vertical offset as needed
                                    .onTapGesture {
                                        withAnimation {
                                            isExpanded.toggle()
                                        }
                                    }
                                
                                // VStack to cointain "Overview" section
                                VStack (alignment: .leading) {
                                    Rectangle()
                                        .frame(height: 0.5)
                                        .foregroundColor(.gray)
                                    
                                    
                                    Text("Overview")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                        .padding(.bottom,8)
                                    
                                    Text(airport.overview)
                                        .foregroundColor(Color("textColor"))
                                        .font(.system(size:18))
                                        .padding(.bottom,15)
                                    
                                    Rectangle()
                                        .frame(height: 0.5)
                                        .foregroundColor(.gray)
                                }
                                .padding(.horizontal,10)
                                
                                // VStack to contain Location section
                                VStack (alignment: .leading) {
                                    Text("Location")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                    
                                    // Address line. Move to full-screen map view if it's tapped
                                    Text(airport.address)
                                        .font(.system(size: 18))
                                        .padding(.bottom, 8)
                                        .foregroundColor(Color("textColor"))
                                        .onTapGesture {
                                            isMapViewPresented = true
                                        }
                                    
                                    // Display a small preview
                                    MapView(coordinate: airport.locationCoordinate)
                                        .frame(height:300)
                                        .cornerRadius(10) // Add corner radius to the MapView
                                        .shadow(radius: 4) // Add shadow decoration to the MapView
                                    
                                    
                                    // Add a line (gray)
                                    Rectangle()
                                        .frame(height: 0.5)
                                        .foregroundColor(.gray)
                                }
                                .padding(.horizontal,10)
                                
                                // VStack for "What's to explore" section
                                VStack (alignment: .leading) {
                                    Text("What's to explore")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                    
                                    // Show the buttons for each popular destination
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 15) {
                                            ForEach(airport.destinations) { destination in
                                                NavigationLink(destination: ExploreCardView(destination: destination)) {
                                                                                        SmallCardView(destination: destination)
                                                                                    }
                                                
                                            }
                                        }
                                        .padding(.trailing)
                                    }
                                    
                                }
                                .padding(.horizontal, 10)
                                
                            }
                            
                        }
                        .edgesIgnoringSafeArea(.top)
                    }
                }
            }
            .fullScreenCover(isPresented: $isMapViewPresented) {
                NavigationView {
                    MapView(coordinate: airport.locationCoordinate)
                        .ignoresSafeArea()
                        .navigationBarItems(trailing:
                                                Button(action: {
                            // Dismiss the full-screen MapView
                            isMapViewPresented = false
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.black)
                        }
                        )
                }
            }
            
            
            .onAppear {
                // Set up a Timer to update the current time every second
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    self.currentTime = self.getCurrentTime()
                }
                // Set the initial value of the current time
                self.currentTime = self.getCurrentTime()
            }
        }


    
    func rowCell(_ title: String, _ value: String) -> some View {
            VStack(spacing: 0) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.vertical, 8)
                
                Text(value)
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.vertical, 6)
            }
            .padding(.horizontal, 10)
        }
    
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm, MMM d, yyyy" // Format the time and date
        let timeZone = TimeZone(identifier: airport.timeIdentifier) // Get the system's current time zone
        formatter.timeZone = timeZone // Set the time zone
        let currentTime = Date()
        let gmtOffset = timeZone?.secondsFromGMT(for: currentTime) ?? 0
        let gmtOffsetHours = gmtOffset / 3600
        let gmtOffsetString = String(format: "%+d", gmtOffsetHours)
        return formatter.string(from: currentTime) + " (GMT" + gmtOffsetString + ")"
    }
}



struct Airport_Previews: PreviewProvider {
    static var previews: some View {
        AirportView(airport: airports[2])
    }
}
