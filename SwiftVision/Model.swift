//
//  Model.swift
//  SwiftVision
//
//  Created by Alphonso Sensley II on 7/29/23.
//

import Foundation

struct Root: Decodable {
    let choices: [Choice]
}

struct Choice: Decodable {
    let message: Message
}

struct Message: Decodable {
    let content: String
}


struct History: Codable {
    var history: [String: String]
}
