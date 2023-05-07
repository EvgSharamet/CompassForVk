//
//  ContentView.swift
//  CompassForVk
//
//  Created by Евгения Шарамет on 06.05.2023.
//

import SwiftUI

struct CompassView: View {
    @ObservedObject var compassService = CompassService()
    
    var body: some View {
        VStack {
            Image("redCross")
            Image("compass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(Angle(degrees: self.compassService.degrees))
            Text("\(Int(-self.compassService.degrees))°")
                .font(.largeTitle)
        }
        .background(Image("mapBackground"))
        .onChange(of: self.compassService.degrees) { newValue in
            let impactHeavy = UIImpactFeedbackGenerator(style: .medium)
            impactHeavy.impactOccurred()
        }
    }
}
