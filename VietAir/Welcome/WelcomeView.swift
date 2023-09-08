/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 19/07/2023
  Last modified: 05/08/2023
  Acknowledgement: https://stackoverflow.com/questions/60139152/swiftui-pulsating-animation-change-colour
*/

import SwiftUI

struct WelcomeView: View {
    @State private var animate = false
    @State private var pulsing = false
    
    var body: some View {
        ZStack {
            // Custom animated gradient background
            AnimatedMovingGradientBackgroundView()
            
            VStack {
                Spacer()
                
                // Logo with pulsating animation
                ZStack{
                    CircleLayerView()
                        .scaleEffect(pulsing ? 1.15 : 1.0)
                    Image("airport")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                        //.scaleEffect(pulsing ? 1.1 : 1.0)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                                self.pulsing.toggle()
                            }
                        }
                        .padding(.bottom, 40)
                                }
                
                
                // Title with custom font, fade-in animation, and parallax effect
                Text("VietAir")
                   .foregroundColor(.black)
                   .font(.custom("Lobster", size: 50))
                   .fontWeight(.semibold) // Add font weight
                   .shadow(color: .black, radius: 3, x: 0, y: 2) // Add a shadow
                   .opacity(animate ? 1.0 : 0.0)
                   .offset(x: animate ? 0 : -50, y: animate ? 0 : -50)
                   .onAppear {
                       withAnimation(Animation.easeInOut(duration: 3)) {
                           self.animate = true
                       }
                   }
               Spacer()
               // Slogan with fade-in animation and parallax effect
               Text("Connect to aviation world")
                   .foregroundColor(.black)
                   .font(.custom("Lobster", size: 28))
                   .fontWeight(.medium) // Add font weight
                   .multilineTextAlignment(.center) // Center the text
                   .padding(.horizontal, 40) // Add some padding
                   .shadow(color: .black, radius: 3, x: 0, y: 2) // Add a shadow
                   .opacity(animate ? 1.0 : 0.0)
                   .offset(x: animate ? 0 : 50, y: animate ? 0 : 50)
                   .onAppear {
                       withAnimation(Animation.easeInOut(duration: 3)) {
                           self.animate = true
                                       }
                                   }
                
                Spacer()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                animate = true
            }
        }
    }
}




struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}



