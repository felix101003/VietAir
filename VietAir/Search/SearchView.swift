/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 01/08/2023
  Last modified: 03/08/2023
  Acknowledgement: https://github.com/TomHuynhSG/SSET-Contact-List-iOS/blob/main/ContactList/Views/ContentView.swift
*/
import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass") // Add a magnifying glass icon to the leading edge
                .foregroundColor(.gray)
                .padding(.leading, 8)

            TextField("Enter keyword", text: $searchText)
                .autocorrectionDisabled(true) // this prevents the autocorrection
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .colorScheme(.light) // Keep the color when in dark mode
        }
        .background(Color.white) // Add a white background to the SearchBar
        .cornerRadius(10) // Add corner radius to the SearchBar
        .padding(.horizontal, 16)
        .padding(.vertical, 15)
    }
}

struct SearchView: View {
    @State private var searchText = ""
    @State private var isSearchResultEmpty = false
    @State private var searchTextChanged = false // Track changes in search text

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                SearchBar(searchText: $searchText)
                    .padding(.top, 5)
                    .frame(height: 55)
                    .background(Color(red: 0.85, green: 0.8, blue: 0.94))
                
                List(airports.filter {
                    searchText.isEmpty ? true : ($0.name.localizedCaseInsensitiveContains(searchText) ||
                                                 $0.country.localizedCaseInsensitiveContains(searchText) ||
                                                 $0.city.localizedCaseInsensitiveContains(searchText) ||
                                                 $0.iataCode.localizedCaseInsensitiveContains(searchText)
                    )
                }) { airport in
                    NavigationLink(destination: AirportView(airport: airport)) {
                        SearchRow(airport: airport)
                    }.listRowBackground(Color("listRowColor"))
    
                }
            }
            
            if isSearchResultEmpty {
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        Text("No airport found")
                            .foregroundColor(.gray)
                            .padding(.bottom, geometry.size.height / 2 )
                            .font(.title) // Make the text larger and more attractive
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
        .onChange(of: searchText) { newValue in
            // Update the searchTextChanged state
            searchTextChanged = true
            
            // Update the isSearchResultEmpty state based on the new value
            isSearchResultEmpty = airports.filter {
                newValue.isEmpty ? true : ($0.name.localizedCaseInsensitiveContains(newValue) ||
                                           $0.country.localizedCaseInsensitiveContains(newValue) ||
                                           $0.city.localizedCaseInsensitiveContains(newValue) ||
                                           $0.iataCode.localizedCaseInsensitiveContains(searchText)
                )
            }.isEmpty
        }
        .onAppear {
            // Reset searchTextChanged when the view appears again
            searchTextChanged = false
        }
        .onChange(of: searchTextChanged) { newValue in
            // Update searchText only when searchTextChanged is true
            if newValue {
                searchText = searchText
            }
        }
    }
}





struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
