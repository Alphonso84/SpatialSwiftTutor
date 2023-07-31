//
//  QuestionTypePicker.swift
//  SwiftVision
//
//  Created by Alphonso Sensley II on 7/30/23.
//

import SwiftUI

struct QuestionTypePicker: View {
    @ObservedObject var viewModel: ContentEditorView_ViewModel
    var body: some View {
        Picker("Question Type", selection: $viewModel.questionType) {
            ForEach(QuestionType.allCases) { question in
                Text(question.rawValue).tag(question)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

