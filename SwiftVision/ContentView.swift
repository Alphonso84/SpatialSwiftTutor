//
//  ContentView.swift
//  SwiftVision
//
//  Created by Alphonso Sensley II on 7/29/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List {
                Text("Item")
            }
            .navigationTitle("Sidebar")
        } detail: {
            VStack {
                Model3D(named: "Scene", bundle: realityKitContentBundle)
                    .padding(.bottom, 50)

                Text("Hello, world!")
            }
            .navigationTitle("Content")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
