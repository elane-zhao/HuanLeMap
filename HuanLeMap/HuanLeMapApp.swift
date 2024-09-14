//
//  HuanLeMapApp.swift
//  HuanLeMap
//
//  Created by Elane Zhao on 9/8/24.
//

import SwiftUI

@main
struct HuanLeMapApp: App {
    @State var locationsViewModel = LocationViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
               .environment(locationsViewModel)
        }
    }
}
