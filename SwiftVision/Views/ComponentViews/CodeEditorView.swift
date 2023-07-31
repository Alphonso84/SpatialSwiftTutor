//
//  CodeEditorView.swift
//  SwiftVision
//
//  Created by Alphonso Sensley II on 7/29/23.
//

import SwiftUI
// CodeEditorView Component
struct CodeEditorView: View {
    @ObservedObject var viewModel: ContentEditorView_ViewModel
    @Binding var questionType: QuestionType

    var body: some View {
        VStack {
            Text(questionType == .Code ? "Paste Your Swift Code Below:" : "Type Your iOS Question Below:")
                .padding()
            
            TextEditor(text: $viewModel.writing) 
                .font(.custom("SF Mono Regular", size: 17))
                //.border(Color(UIColor.systemGray), width: 1)
                .padding(.leading)
                .padding(.trailing)
            
            Button(action: {
                viewModel.analyzeWriting()
            }) {
                Text(questionType == .Code ? "Refactor This" : "Get Answer")
            }
            .foregroundColor(.primary)
            .padding()
            //.background(Color(UIColor.secondarySystemBackground)) // secondary background color
            .cornerRadius(25) // corner radius of 25
            
        }
        Spacer()
    }
}
