//
//  LocationListViews.swift
//  HuanLeMap
//
//  Created by Elane Zhao on 9/8/24.
//

import SwiftUI

struct LocationListView: View {
    @Environment(LocationViewModel.self) var viewModel
    
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                Button {
                    viewModel.updateCurrentLocation(newLocation: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

extension LocationListView {
    func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 45)
                    .frame(width: 45)
                    .cornerRadius(10.0)
                    
            }
            VStack(alignment: .leading) {
                Text("\(location.name)")
                    .font(.headline)
                Text("\(location.cityName)")
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
             
        }
    }
}

#Preview {
    LocationListView()
        .environment(LocationViewModel())
}
