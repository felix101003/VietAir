/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 28/07/2023
  Last modified: 01/08/2023
  Acknowledgement: https://stackoverflow.com/questions/68688270/ios-15-uitabbarcontrollers-tabbar-background-color-turns-black
*/


import SwiftUI
struct HomeView: View {
    @AppStorage("isDarkMode") var isDarkMode = false
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0.85, green: 0.95, blue: 1.0, alpha: 1.0)
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some View {
        NavigationView {
                TabView {
                    // First Tab
                    FirstView(isDarkMode: isDarkMode)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    
                    // Second Tab (Europe)
                    SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Find")
                    }
                }
            }
        .onAppear {
            isDarkMode = false
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

