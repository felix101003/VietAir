/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 02/07/2023
  Last modified: 02/08/2023
  Acknowledgement: None
*/


import Foundation
import SwiftUI

struct CardView: View {
    var airport: Airport
    
    var body: some View {
        ZStack {
            VStack {
                Image(airport.imageName[0])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 330, height: 180)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 2)
                    )
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(airport.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    
                    HStack {
                        StarsView(rating:airport.rating)
                            .frame(width:120)
                        
                        Text(String(format: "%.1f", airport.rating) + " (\(airport.review))")
                            .fontWeight(.medium)
                            .font(.system(size:20))
                            .foregroundColor(.black)
                    }
                }
                .padding(.top, 8)
            }
            .padding()
            .foregroundColor(.white)
            .font(.headline)
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        }
        .background(Color.cardBackground) // Add a background color
        .frame(width:350, height:300)
        .cornerRadius(30)
    }
}

// Add custom color for CardBackground
extension Color {
    static let cardBackground = Color(red: 0.78, green: 0.85, blue: 0.95)
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(airport:airports[0])
    }
}
