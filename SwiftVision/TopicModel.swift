//
//  TopicModel.swift
//  SwiftVision
//
//  Created by Alphonso Sensley II on 7/30/23.
//

import Foundation


struct TopicModel {
    var topicsAndSubTopicDict: [String:[String]]
    let orderedKeys: [String] = ["Basics of Swift", "Operators", "Control Flow", "Functions", "Collections", "Optionals", "Structs & Classes", "Initialization", "Protocols and Extensions", "Error Handling"]
    init() {
        self.topicsAndSubTopicDict =   [
            "Basics of Swift":[
                "Variables and Constants (let vs var)",
                "Basic Data Types (String, Int, Double, Boolean)",
                "Type Inference"],
            "Operators": [
                "Arithmetic Operators",
                "Compound Assignment Operators",
                "Comparison Operators",
                "Logical Operators"],
            "Control Flow": [
                "Conditional Statements (if, else, switch)",
                "Loops (for, while, repeat-while)",
                "Control Transfer Statements (continue, break)"],
            "Functions": [
                "Defining and Calling Functions",
                "Function Parameters and Return Values",
                "Function Argument Labels and Parameter Names",
                "Default Parameters",
                "Variadic Parameters"],
            "Collections": [
                "Arrays",
                "Sets",
                "Dictionaries",
                "Iterating Over Collections"],
            "Optionals": [
                "Understanding Optionals",
                "Optional Binding",
                "Implicitly Unwrapped Optionals",
                "Optional Chaining"],
            "Structs & Classes": [
                "Defining and Creating Structs",
                "Computed Properties",
                "Property Observers",
                "Defining and Creating Classes",
                "Identity Operators",
                "Inheritance",
                "Overriding Methods"],
            "Initialization": [
                "Initializer Delegation",
                "Failable Initializers",
                "Required Initializers"],
            "Protocols and Extensions": [
                "Protocol Syntax",
                "Protocol Conformance",
                "Protocol Inheritance",
                "Extensions"],
            "Error Handling": [
                "Representing and Throwing Errors",
                "Handling Errors",
                "Specifying Clean-Up Actions"]
        ]
    }
}

