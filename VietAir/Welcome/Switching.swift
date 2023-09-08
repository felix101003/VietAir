/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 20/07/2023
  Last modified: 02/08/2023
  Acknowledgement: https://github.com/TomHuynhSG/SSET-Contact-List-iOS/blob/main/ContactList/Views/Welcome/WelcomeView.swift.
*/

import Foundation
import SwiftUI

struct Switching: View {
    @State var showNextScreen: Bool = false
    var body: some View {
        ZStack {
            if !showNextScreen {
                WelcomeView()
            } else {
                Switching2()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                showNextScreen = true
            }
        }
    }
}

struct Switch_Previews: PreviewProvider {
    static var previews: some View {
        Switching()
    }
}
