//
//  EnvironmentKeys.swift
//  HuanLeMap
//
//  Created by Elane Zhao on 9/8/24.
//

import Foundation
import SwiftUI


private struct LocationViewModelKey: EnvironmentKey {
    static let defaultValue = LocationViewModel()
}

extension EnvironmentValues {
    var locationViewModel: LocationViewModel {
        get { self[LocationViewModelKey.self] }
        set { self[LocationViewModelKey.self] = newValue }
    }
}
