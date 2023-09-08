/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 20/07/2023
  Last modified: 05/08/2023
  Acknowledgement: https://developer.apple.com/documentation/swiftui/tabviewstyle.
*/

import Foundation
import SwiftUI

struct OnboardingView: View {
    @State private var currentPageIndex = 0 // State variable to track the current tab index
    @Binding var active: Bool // New state variable for tracking onboarding completion
    @State private var showAlert = false
    
    var body: some View {
        
            // Create 2 Tab slides
            TabView(selection: $currentPageIndex) {
                OnboardingSlideView(imageName: "airport_background", title: "Uncover the top-notch airports", currentPageIndex: $currentPageIndex)
                    .tag(0) // Assign tag to each slide to track the index
                
                OnboardingSlideView(imageName: "SIN_2", title: "Explore its architecture and service", currentPageIndex: $currentPageIndex)
                    .tag(1) // Assign tag to each slide to track the index
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .ignoresSafeArea()
            .background(AnimatedMovingGradientBackgroundView())
            
            // Add the "Get Started" button when on the last slide. If tap on this, move to Home page
            if currentPageIndex == 1 {
                VStack {
                    Spacer()
                    Button(action: {
                        active = true
                    }, label: {
                        RoundedRectangle(cornerRadius: 20)
                          .fill(Color.blue.opacity(0.8))
                          .padding(5)
                          .frame(height:80)
                          .overlay(Text("Get Started")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white))
                    })
                    .padding(.bottom,5)
                }
                
            // Add the "About me" button when on the first slide
            } else {
                VStack {
                    Spacer()
                    Button(action: {
                        showAlert = true
                    }, label: {
                        RoundedRectangle(cornerRadius: 20)
                          .fill(Color.blue.opacity(0.8))
                          .padding(5)
                          .frame(height:80)
                          .overlay(Text("About me")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white))
                    })
                    .padding(.bottom,5)
                }
                // If this button is tapped, showw the name of the author
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("About Me"),
                          message: Text("Author's Name: Viet Nguyen Dinh\nStudent ID: s3927291\nApp's Name: VietAir"),
                          dismissButton: .default(Text("OK")))
                }
            }
        }
    
}

struct OnboardingSlideView: View {
    var imageName: String
    var title: String
    
    @Binding var currentPageIndex: Int // Add a binding to receive the current tab index
    @State private var isAnimating = false // State variable for animation
        
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                ZStack {
                    Image(imageName)
                        .resizable()
                        .frame(height: UIScreen.main.bounds.height * 0.65)
                        .clipped()
                        .brightness(-0.1) // Slightly darken the image for better contrast
                        .mask(
                            Rectangle() // Create a rectangle mask for the image
                        )
                    Color.black.opacity(isAnimating ? 0.15 : 0.5) // Semi-transparent overlay with reduced opacity for a softer effect
                }
                .cornerRadius(20) // Rounded corners for the image container
                .frame(height: UIScreen.main.bounds.height * 0.65) // Set the height again to avoid layout issues
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        isAnimating = true // Fade-in animation on slide appear
                    }
                }

                Text(title)
                    .font(.system(size:23))
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 2, x: 0, y: 2) // Add a subtle shadow to the title
                    .opacity(isAnimating ? 1.0 : 0.0) // Opacity animation
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.5)) {
                            isAnimating = true // Fade-in animation on slide appear
                        }
                        isAnimating = false
                    }

            
            }
            .padding(.horizontal,8) // Add horizontal padding to the content
        }
        .padding(.top,-40.0)
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(active: .constant(true))
    }
}
