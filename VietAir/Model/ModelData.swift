/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Dinh Viet
  ID: 3927291
  Created  date: 31/07/2023
  Last modified: 05/08/2023
  Acknowledgement: https://github.com/TomHuynhSG/SSET-Contact-List-iOS/blob/main/ContactList/Model/ModelData.swift
*/
import Foundation
import CoreLocation

var airports = decodeJsonFromJsonFile(jsonFileName: "airports.json")

// How to decode a json file into a struct
func decodeJsonFromJsonFile(jsonFileName: String) -> [Airport] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil){
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Airport].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [ ] as [Airport]
}
