/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 29/07/2023
  Last modified: 03/08/2023
  Acknowledgement: https://stackoverflow.com/questions/64379079/how-to-present-accurate-star-rating-using-swiftui?fbclid=IwAR2Z2A535ftaefkAXgE85WJeXNS3_PIm3haT8PXQtqYznZH4MpxDs9MZHi8
*/
import SwiftUI
struct StarsView: View {
    var rating: Float
    var maxRating = 5

    var body: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }

        stars.overlay(
            GeometryReader { g in
                let width = CGFloat(rating) / CGFloat(maxRating) * g.size.width
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: width)
                        .foregroundColor(.orange)
                }
            }
            .mask(stars)
        )
        .foregroundColor(.gray)
    }
}

struct StarsView_Previews: PreviewProvider {
    static var previews: some View {
        StarsView(rating:airports[4].rating)
    }
}


