/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 28/07/2023
  Last modified: 01/08/2023
  Acknowledgement: https://github.com/TomHuynhSG/SSET-Contact-List-iOS/blob/main/ContactList/Views/ContactRow.swift
*/

import SwiftUI

struct SearchRow: View {
    var airport: Airport
    
    var body: some View {
        HStack(spacing: 15) {
            Image(airport.imageName[0])
                .resizable()
                .frame(width: 70, height: 70)
                .cornerRadius(10) // Add a corner radius to make the image more appealing
                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 2, y: 2) // Add a subtle shadow effect
            
            VStack(alignment: .leading, spacing: 5) {
                Text(airport.name)
                    .font(.headline) // Use a larger font size for the airport name
                    .foregroundColor(Color.black)
                
                Text("\(airport.city), \(airport.country)")
                    .font(.subheadline)
                    .foregroundColor(Color.black)
            }
            .padding(.vertical, 5)
        }
        .padding(.horizontal, 10)
        .cornerRadius(15) // Add a corner radius to the whole row
    }
}


