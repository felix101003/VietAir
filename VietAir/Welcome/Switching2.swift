/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 22/07/2023
  Last modified: 02/08/2023
  Acknowledgement: https://github.com/TomHuynhSG/SSET-Contact-List-iOS/blob/main/ContactList/Views/Welcome/WelcomeView.swift.
*/

import Foundation
import SwiftUI

struct Switching2: View {
    @State var showMain: Bool = false
    var body: some View {
        ZStack {
            if (!showMain) {
                OnboardingView(active: $showMain)
            } else {
                HomeView()
            }
        }
    }
}
