//
//  ContentView.swift
//  SwiftVision
//
//  Created by Alphonso Sensley II on 7/29/23.
//

import SwiftUI
import RealityKit
import RealityKitContent
import VisionKit

// Main View
struct ContentView: View {
    @ObservedObject var viewModel = ContentEditorView_ViewModel()
    @State private var selectedTheme = HighlightrTheme.agate
    @State private var analysisLength = ResponseLength.Short
    @State private var date = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                SidebarView(selectedTheme: $selectedTheme, analysisLength: $analysisLength, viewModel: viewModel)
                //.background(Color(uiColor: .secondarySystemBackground))
                    .onChange(of: viewModel.questionType) { newQuestionType in
                        viewModel.questionType = newQuestionType
                        print(viewModel.questionType)
                    }
            }
            VStack {
                HStack {
                    CodeEditorView(viewModel: viewModel, questionType: $viewModel.questionType)
                    AnalysisResultView(viewModel: viewModel, selectedTheme: $selectedTheme, questionType: $viewModel.questionType)
                }
                
                .onAppear(perform: viewModel.checkFirstLaunch)
                
                .sheet(isPresented: $viewModel.showingModal) {
                    ModalView(showingModal: $viewModel.showingModal)
                }
            }
            .alert(item: $viewModel.requestError) { error in
                Alert(title: Text("Error"), message: Text(error.localizedDescription), dismissButton: .default(Text("Retry"), action: {
                    //viewModel.isLoading = false
                }))
            }
        }
        .navigationViewStyle(DefaultNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}
