//
//  LocationPreviewView.swift
//  HuanLeMap
//
//  Created by Elane Zhao on 9/11/24.
//

import SwiftUI

struct LocationPreviewView: View {
    @Environment(LocationViewModel.self) var viewModel
    let location : Location
    
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                nameSection
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            VStack(spacing: 8) {
                learnMoreSection
                nextSection
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(.ultraThinMaterial)
            .offset(y: 70))
        .cornerRadius(10)
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        LocationPreviewView(location: LocationViewModel().currentLocation)
            .environment(LocationViewModel())
            .padding()
    }

}

extension LocationPreviewView {
    private var imageSection : some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(.white)
        .cornerRadius(10)
    }

    private var nameSection : some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.headline)
            Text(location.cityName)
                .font(.subheadline)
        }
    }
    
    private var learnMoreSection : some View {
        Button {
            viewModel.showSheet()
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(height: 35)
                .frame(width: 125)
        }
        .buttonStyle(BorderedProminentButtonStyle())
        .cornerRadius(10)
    }
    
    private var nextSection : some View {
        Button {
            viewModel.showNextLocation()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(height: 35)
                .frame(width: 125)
        }
        .buttonStyle(BorderedButtonStyle())
        .cornerRadius(10)
    }
}
