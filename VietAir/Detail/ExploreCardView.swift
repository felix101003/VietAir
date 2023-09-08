/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 20/07/2023
  Last modified: 05/08/2023
  Acknowledgement: None
*/
import SwiftUI

struct ExploreCardView: View {
    var destination: Destination

    var body: some View {
        VStack(alignment: .trailing) {
            ScrollView {
                VStack {
                    // Show the picture
                    Image(destination.destImage)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4) // Use screen width as the width
                    
                    // Display name
                    Text(destination.destName)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 10)
                    
                    // Display a description
                    Text(destination.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 10.0)
                        .padding(.top, 8)
                    

                    Spacer()
                        .frame(minHeight: 100) // Add some minimum spacing after the content
                }
                .padding()
            }

            
        }
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}
