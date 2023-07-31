//
//  SideBarView.swift
//  SwiftVision
//
//  Created by Alphonso Sensley II on 7/29/23.
//

import SwiftUI

// SidebarView Component
struct SidebarView: View {
    @Binding var selectedTheme: HighlightrTheme
    @Binding var analysisLength: ResponseLength
    @State var selectedTab: Tab = .topics
    @State private var date = Date()
    @ObservedObject var viewModel: ContentEditorView_ViewModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Picker(selection: $selectedTab, label: Text(""), content:{
                Text("Topics").tag(Tab.topics)
                Text("History").tag(Tab.history)
                Text("About").tag(Tab.about)
            })
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            ZStack {
                switch selectedTab {
                case .topics:
                    // Show topics view
                    VStack {
                        SideBarSeparator()
                        SwiftTopicsView()
                       
                        Spacer()
                    }
                case .history:
                    // Show history view
                    VStack {
                        
                        SideBarSeparator()
                        List(viewModel.historyDictionary.history.keys.sorted(), id: \.self) { key in
                                   Text(key)
                               }
                    }
                case .about:
                    // Show about view
                    VStack {
                        SideBarSeparator()
                        Spacer()
                    }
                }
            }
        }
        .padding()
        
    }
}

#Preview {
    SidebarView(selectedTheme: .constant(HighlightrTheme.agate), analysisLength:.constant(.Short), viewModel: ContentEditorView_ViewModel())
}
