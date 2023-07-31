//
//  TopicsView.swift
//  SwiftVision
//
//  Created by Alphonso Sensley II on 7/30/23.
//

import SwiftUI

struct SwiftTopicsView: View {
    let swiftTopics: [String: [String]] = TopicModel().topicsAndSubTopicDict
    let orderedKeys = TopicModel().orderedKeys
    var body: some View {
        List {
            ForEach(orderedKeys, id: \.self) { key in
                Section(header:
                            HStack {
                    //Spacer()  // Spacer on the left
                    Text(key)
                        .font(.title3)
                        .bold()
                    // Spacer()  // Spacer on the right
                }
                    .padding()
                ) {
                    ForEach(swiftTopics[key]!, id: \.self) { value in
                        Text(value)
                            .onTapGesture {
                               print("Value: \(value)")
                            }
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}
