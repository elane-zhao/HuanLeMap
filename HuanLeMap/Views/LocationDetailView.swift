//
//  LocationDetailView.swift
//  HuanLeMap
//
//  Created by Elane Zhao on 9/14/24.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    let location : Location
    @Environment(LocationViewModel.self) private var viewModel
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            ScrollView {
                imageSection
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                VStack(alignment: .leading) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding()
            }
            .ignoresSafeArea()
            backButton
        }
        
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environment(LocationViewModel())
}

extension LocationDetailView {
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .foregroundStyle(.secondary)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(location.description)
                .foregroundStyle(.secondary)
                
            if let url = URL(string: location.link) {
                Link("Read more on Wikipedia", destination: url)
                    .foregroundStyle(.blue)
                    .font(.headline)
            }
        }
    }
    
    private var mapLayer: some View {
        Map(position: .constant(
            MapCameraPosition.region(
                MKCoordinateRegion(
                    center: location.coordinates,
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.005,
                        longitudeDelta: 0.005
                    )
                )
            )
        )) {
            Annotation("", coordinate: viewModel.getRegion(location: location).center) {
                MapPinView()
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
        }
        .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
    }
    
    private var backButton: some View {
        Button(action: {
            viewModel.hideSheet()
        }, label: {
            Image(systemName: "xmark")
                .tint(.primary)
        })
        .font(.headline)
        .padding()
        .background(.thickMaterial)
        .cornerRadius(10)
        .offset(x: 15.0)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}
