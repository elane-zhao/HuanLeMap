//
//  Location.swift
//  HuanLeMap
//
//  Created by Elane Zhao on 9/8/24.
//

import Foundation
import MapKit

struct Location : Identifiable, Equatable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        name + cityName
    }
    
    init(name: String = "", cityName: String = "", coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), description: String = "", imageNames: [String] = [], link: String = "") {
        self.name = name
        self.cityName = cityName
        self.coordinates = coordinates
        self.description = description
        self.imageNames = imageNames
        self.link = link
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }
}


