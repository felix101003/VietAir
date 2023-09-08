/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 23/07/2023
  Last modified: 01/08/2023
  Acknowledgement: https://www.appcoda.com/animate-gradient-swiftui/
*/


import Foundation
import SwiftUI

struct ColorConstants {
    static let backgroundColorLightMode = [Color(red: 0.9, green: 0.9, blue: 1.0), Color(red: 0.85, green: 0.9, blue: 1.0), Color(red: 0.9, green: 0.9, blue: 1.0)]
    
    static let backgroundColorDarkMode = [Color(red: 0.35, green: 0.4, blue: 0.5), Color(red: 0.3, green: 0.35, blue: 0.3), Color(red: 0.35, green: 0.3, blue: 0.5)]
}

struct AnimatedMovingGradientBackgroundView: View {
    @Environment(\.colorScheme) var colorScheme // Add the environment variable

    @State private var gradientColors: [Color] = [Color(red: 0.9, green: 0.9, blue: 1.0), Color(red: 0.85, green: 0.9, blue: 1.0), Color(red: 0.9, green: 0.9, blue: 1.0)]
    private let gradientAnimationDuration: Double = 6.0 // Duration of the full animation (increased to 6 seconds)

    var body: some View {
        ZStack {
            // Use the backgroundColor based on the colorScheme
            if colorScheme == .dark {
                LinearGradient(gradient: Gradient(colors: ColorConstants.backgroundColorDarkMode), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .edgesIgnoringSafeArea(.all)
            } else {
                LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .onAppear {
            startGradientAnimation()
        }
        .preferredColorScheme(colorScheme) // Set the preferredColorScheme
    }

    private func startGradientAnimation() {
        let newGradientColors: [Color] = [Color(red: 0.85, green: 0.8, blue: 0.94), Color(red: 0.85, green: 0.95, blue: 0.8), Color(red: 0.55, green: 0.8, blue: 0.95)]

        withAnimation(Animation.timingCurve(0.5, 0.0, 0.5, 1.0, duration: gradientAnimationDuration)) {
            gradientColors = newGradientColors
        }
    }
}

struct AnimatedMovingGradientBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedMovingGradientBackgroundView()
    }
}


