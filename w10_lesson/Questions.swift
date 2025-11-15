//
//  Questions.swift
//  w10_lesson
//
//  Created by natalee chen on 07/11/2025.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let hiragana: String
    let options: [String]
    let correctAnswerIndex: Int
}
