//
//  AnalysisResultView.swift
//  SwiftVision
//
//  Created by Alphonso Sensley II on 7/29/23.
//

import SwiftUI
// AnalysisResultView Component
struct AnalysisResultView: View {
    @ObservedObject var viewModel = ContentEditorView_ViewModel()
    @Binding var selectedTheme: HighlightrTheme
    @Binding var questionType: QuestionType

    var body: some View {
        VStack {
            Text(questionType == .Code ? "Refactored Swift Code" : "SwiftAssistant Answer")
                .padding()
            if viewModel.isLoading {
                
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            } else {
                ZStack{
                    TypingView(fullText:viewModel.analysis, theme:selectedTheme.rawValue)
                        .textSelection(.enabled)
                        .frame(maxWidth:.infinity,maxHeight: .infinity)
                        .frame(depth: 150)
                        //.border(Color(UIColor.systemGray), width:1)
                        .padding(.leading)
                        .padding(.trailing)
                    if viewModel.showCheckmark {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.green)
                            .opacity(viewModel.showCheckmark ? 1 : 0)
                            .animation(.easeInOut(duration: 2))
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation {
                                        viewModel.showCheckmark = false
                                    }
                                }
                            }
                    }
                }
            }
            Button(action: viewModel.copyToClipboard) {
                Text("Copy Refactored Code to Clipboard")
                    .foregroundColor(.primary) // Adjust color for light and dark mode
                    .padding()
                    //.background(Color(UIColor.secondarySystemBackground)) // secondary background color
                    .cornerRadius(25) // corner radius of 25
            }
        }
    }
}
