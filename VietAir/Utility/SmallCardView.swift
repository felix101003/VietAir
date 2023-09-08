/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 02/08/2023
  Last modified: 04/08/2023
  Acknowledgement: None
*/

import Foundation
import SwiftUI

struct SmallCardView: View {
    var destination: Destination
    
    var body: some View {
        ZStack {
            VStack {
                Image(destination.destImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 270, height: 180)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 2)
                    )
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(destination.destName)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                }
                .padding(.top, 8)
            }
            .padding()
            .foregroundColor(.white)
            .font(.headline)
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        }
        .background(Color.cardBackground) // Add a background color
        .frame(width:300, height:280)
        .cornerRadius(30)
    }
}

struct SmallCardView_Previews: PreviewProvider {
    static var previews: some View {
        SmallCardView(destination: airports[0].destinations[0])
    }
}
