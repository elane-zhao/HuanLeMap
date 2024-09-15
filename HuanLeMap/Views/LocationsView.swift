//
//  LocationsView.swift
//  HuanLeMap
//
//  Created by Elane Zhao on 9/8/24.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @Environment(LocationViewModel.self) var viewModel
    private let ipadWidth: CGFloat = 700

    var body: some View {
        @Bindable var bindableViewModel = viewModel
        ZStack {
            mapLayer
                .ignoresSafeArea()
            VStack{
                header
                    .padding()
                    .frame(maxWidth: ipadWidth)
                Spacer()
                previewCard
            }
            .sheet(item: $bindableViewModel.sheetLocation, content: { location in
                LocationDetailView(location: location)
            })
            .padding(.top, 8)
            .padding(.horizontal, 12)
        }
    }
}

extension LocationsView {
    private var header: some View {
        
        VStack {
            Button {
                viewModel.toggleShowList()
            } label: {
                Text("\(viewModel.currentLocation.name), \(viewModel.currentLocation.cityName)")
                    .font(.title2)
                    .fontWeight(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .padding()
                            .rotationEffect(Angle(degrees: viewModel.showList ? 0 : 180))
                    }
                    
            }
            if viewModel.showList {
                LocationListView()
            }
            
        }
        .foregroundStyle(.primary)
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)

    }
    
    private var previewCard: some View {
      ZStack {
          ForEach(viewModel.locations) { location in
            if location == viewModel.currentLocation {
                LocationPreviewView(location: location)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding()
                    .frame(maxWidth: ipadWidth)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            }
          }
      }
    }
    
    private var mapLayer: some View {
        Map(position: .constant(MapCameraPosition.region(viewModel.region))) {
            ForEach(viewModel.locations) { location in
                Annotation("", coordinate: viewModel.getRegion(location: location).center) {
                    MapPinView()
                        .scaleEffect(location == viewModel.currentLocation ? 1.0: 0.7)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            viewModel.updateCurrentLocation(newLocation:  location)
                        }
                }
            }
        }
    }
}

#Preview {
    LocationsView()
        .environment(LocationViewModel())
}

