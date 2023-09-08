/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 28/07/2023
  Last modified: 01/08/2023
  Acknowledgement: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-toggle-switch
*/

import Foundation
import SwiftUI
struct FirstView: View {
    @State private var searchText = ""
    @AppStorage("isDarkMode") var isDarkMode = false
    
    var body: some View {
        ZStack {
            VStack(spacing:0) {
                ZStack {
                    Toggle(isOn: $isDarkMode, label: {
                            EmptyView() // EmptyView as a label to align the toggle
                        })
                    .toggleStyle(SwitchToggleStyle(tint: .black))
                    .padding(.trailing, 20)
                }.ignoresSafeArea()
                .frame(height:55)
                .background(Color(red: 0.85, green: 0.8, blue: 0.94))
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 30) {
                        
                        // Asia scroll
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Asia")
                                .font(.title) // Set the font to a title size
                                .fontWeight(.bold) // Make it bold
                                .foregroundColor(Color("textColor")) // Set the text color
                                .padding(.top, 20)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(airports.filter { $0.region == "Asia"}) { airport in
                                        NavigationLink(
                                            destination: AirportView(airport: airport),
                                            label: {
                                                CardView(airport: airport)
                                            }
                                        )
                                    }
                                }
                                .padding(.trailing,15)
                                .padding(.leading,5)
                            }
                        }
                        
                        // Middle East scroll
                        VStack(alignment: .leading, spacing:10) {
                            Text("Middle East")
                                .font(.title) // Set the font to a title size
                                .fontWeight(.bold) // Make it bold
                                .foregroundColor(Color("textColor")) // Set the text color
                                .padding(.top, 20)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(airports.filter { $0.region == "Middle East" }) { airport in
                                        NavigationLink(
                                            destination: AirportView(airport: airport),
                                            label: {
                                                CardView(airport: airport)
                                            }
                                        )
                                    }
                                    .padding(.trailing)
                                }
                            }
                        }
                        
                        //Europe scroll
                        VStack(alignment: .leading, spacing:10) {
                            Text("Europe")
                                .font(.title) // Set the font to a title size
                                .fontWeight(.bold) // Make it bold
                                .foregroundColor(Color("textColor")) // Set the text color
                                .padding(.top, 20)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(airports.filter { $0.region == "Europe" }) { airport in
                                        NavigationLink(
                                            destination: AirportView(airport: airport),
                                            label: {
                                                CardView(airport: airport)
                                            }
                                        )
                                    }
                                    .padding(.trailing)
                                }
                            }
                        }
                        
                        //North America scroll
                        VStack(alignment: .leading, spacing:10) {
                            Text("North America")
                                .font(.title) // Set the font to a title size
                                .fontWeight(.bold) // Make it bold
                                .foregroundColor(Color("textColor")) // Set the text color
                                .padding(.top, 20)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(airports.filter { $0.region == "North America" }) { airport in
                                        NavigationLink(
                                            destination: AirportView(airport: airport),
                                            label: {
                                                CardView(airport: airport)
                                            }
                                        )
                                    }
                                    .padding(.trailing)
                                }
                            }
                        }
                        
                        //Europe scroll
                        VStack(alignment: .leading, spacing:10) {
                            Text("Oceania")
                                .font(.title) // Set the font to a title size
                                .fontWeight(.bold) // Make it bold
                                .foregroundColor(Color("textColor")) // Set the text color
                                .padding(.top, 20)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(airports.filter { $0.region == "Australia/Pacific" }) { airport in
                                        NavigationLink(
                                            destination: AirportView(airport: airport),
                                            label: {
                                                CardView(airport: airport)
                                            }
                                        )
                                    }
                                    .padding(.trailing)
                                }
                            }
                        }
                        
                        
                        
                        
                    }
                    .padding(.leading)
                    .padding(.vertical,5)
                }
            }
        }
        .background(AnimatedMovingGradientBackgroundView())
        .preferredColorScheme(isDarkMode ? .dark : .light) 
    }
}

struct FirstTab_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
