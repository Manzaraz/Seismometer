//
//  NeedleSeismometer.swift
//  Seismometer
//
//  Created by Christian Manzaraz on 21/05/2024.
//

import SwiftUI

struct NeedleSeismometer: View {
    @EnvironmentObject var motionDetector: MotionDetector
    
    let needleAnchor = UnitPoint(x: 0.5, y: 1)
    let amplification = 2.0
    var rotationAngle: Angle {
        Angle(radians: -motionDetector.zAcceleration * amplification)
    }
    
    var body: some View {
        VStack {
            Spacer()
            ZStack(alignment: .bottom) {
                GaugeBackground(width: 250)
                Rectangle()
                    .foregroundStyle(Color.accentColor)
                    .frame(width: 5, height: 190)
                    .rotationEffect(rotationAngle, anchor: needleAnchor)
                    .overlay {
                        VStack {
                            Spacer()
                            Circle()
                                .stroke(lineWidth: 3)
                                .fill()
                                .frame(width: 10, height: 10)
                                .foregroundStyle(Color.accentColor)
                                .background(Color.white)
                        }
                    }
            }
            
            Spacer()
            Text("something goes here...")
//            Text("\(motionDetector.zAcceleration.describeAsFixedLengthString())")
                .font(.system(.body, design: .monospaced))
                .fontWeight(.bold)
            
            Spacer()
            Text("Set your device on a flat surface to record vibrations using its motion sensors.")
                .padding()
            
            Spacer()
        }
    }
}

struct NeedleSeismometer_Previews: PreviewProvider {
    @StateObject static private var detector = MotionDetector(updateInterval: 0.01).started()
    
    static var previews: some View {
        NeedleSeismometer()
            .environmentObject(detector)
    }
}
