//
//  LocationViewModel.swift
//  HuanLeMap
//
//  Created by Elane Zhao on 9/8/24.
//

import Foundation
import MapKit
import SwiftUI

@Observable class LocationViewModel {
    var locations : [Location] = []
    var currentLocIndex: Int = 0
    var currentLocation: Location = Location() {
        didSet {
            updateRegion()
            guard let index = locations.firstIndex(of: currentLocation) else {
                print("Cannot find current location in the location array...")
                return
            }
            currentLocIndex = index
        }
    }
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    var region: MKCoordinateRegion = MKCoordinateRegion()
    var showList = false
    var sheetLocation: Location? = nil
    
    init() {
        locations = LocationsDataService.locations
        currentLocation = locations.first!
    }
    
    func updateRegion() {
        region = MKCoordinateRegion(center: currentLocation.coordinates, span: mapSpan)
    }
    
    func getRegion(location: Location) -> MKCoordinateRegion {
        return MKCoordinateRegion(center: location.coordinates, span: mapSpan)
    }
    
    func toggleShowList(){
        withAnimation(.easeInOut) {
            showList.toggle()
        }
    }
    
    func updateCurrentLocation(newLocation: Location) {
        withAnimation(.easeInOut) {
            currentLocation = newLocation
            showList = false
        }
    }
    
    func showNextLocation() {
        currentLocIndex = (currentLocIndex + 1) % locations.count
        updateCurrentLocation(newLocation: locations[currentLocIndex])
    }
    
    func showSheet() {
        sheetLocation = currentLocation
    }
    
    func hideSheet() {
        sheetLocation = nil
    }
}
