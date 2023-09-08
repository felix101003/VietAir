/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 20/07/2023
  Last modified: 20/07/2023
  Acknowledgement: None.
*/
import SwiftUI
import Foundation
struct CircleButton: View {
    var image: String
    
    var body: some View {
        Image(systemName: image)
            .resizable()
            .frame(width: 30, height: 30)
    }
}

struct CircleLayerView: View {
    var body: some View {
        ZStack {
          Circle()
                .stroke(.white.opacity(0.4), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
          Circle()
            .stroke(.white.opacity(0.2), lineWidth: 90)
            .frame(width: 260, height: 260, alignment: .center)
        }
    }
}
