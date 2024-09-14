//
//  MapPinView.swift
//  HuanLeMap
//
//  Created by Elane Zhao on 9/13/24.
//

import SwiftUI

struct MapPinView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "ev.plug.dc.chademo")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(Color.white)
                .padding(6)
                .background(Color.accentColor)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
                .foregroundColor(Color.accentColor)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -4)
                .padding(.bottom, 40)
        }
    }
}

#Preview {
    MapPinView()
}
