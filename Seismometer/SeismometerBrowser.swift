//
//  SeismometerBrowser.swift
//  Seismometer
//
//  Created by Christian Manzaraz on 21/05/2024.
//

import SwiftUI

struct SeismometerBrowser: View {
    @StateObject private var detector = MotionDetector(updateInterval: 0.01)
    
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink(destination: NeedleSeismometer()) {
                    HStack() {
                        Image(systemName: "gauge")
                            .foregroundStyle(Color.accentColor)
                            .padding()
                            .font(.title2)
                            
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Needle")
                                .font(.headline)
                            Text("A needle that responds to the device's vibration.")
                                .font(.caption)
                        }
                        .padding(.trailing)
                    }
                }
                .padding()
                
                // Aqui va otro navigationLink apuntando ad GraphSeismometer()
            }
            .listStyle(.plain)
            .navigationTitle(Text("Seismometer"))
        } detail: {
            Text("Select a Seismometer Example")
                .foregroundStyle(.secondary)
        }
        .environmentObject(detector)
        .onAppear() {
            detector.start()
        }
        .onDisappear() {
            detector.stop()
        }
    }
}

#Preview {
    SeismometerBrowser()
}
