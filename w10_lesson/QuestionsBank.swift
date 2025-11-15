//
//  QuestionsBank.swift
//  w10_lesson
//
//  Created by natalee chen on 07/11/2025.
//

import Foundation

struct QuestionsBank {
    
    static func provide() -> [Question] { // when called, returns an array of Question
        let questions: [Question] = [
            Question(text: "危ない", hiragana: "あぶない", options: ["dangerous", "fulfilling", "tiring", "safe"], correctAnswerIndex: 0),
            Question(text: "美しい", hiragana: "うつくしい", options: ["beautiful", "boring", "expensive", "cheap"], correctAnswerIndex: 0),
            Question(text: "寂しい", hiragana: "さびしい", options: ["lonely", "noisy", "tiring", "cheerful"], correctAnswerIndex: 0),
            Question(text: "寒い", hiragana: "さむい", options: ["cold", "warm", "spicy", "savory"], correctAnswerIndex: 0),
            Question(text: "嬉しい", hiragana: "うれしい", options: ["happy", "worry", "calm", "angry"], correctAnswerIndex: 0),
            Question(text: "悲しい", hiragana: "かなしい", options: ["sad", "worry", "calm", "angry"], correctAnswerIndex: 0),
            Question(text: "暑い", hiragana: "あつい", options: ["hot", "cold", "sweet", "bitter"], correctAnswerIndex: 0),
            Question(text: "新しい", hiragana: "あたらしい", options: ["new", "old", "cheap", "heavy"], correctAnswerIndex: 0),
            Question(text: "古い", hiragana: "ふるい", options: ["old", "new", "fast", "slow"], correctAnswerIndex: 0),
            Question(text: "高い", hiragana: "たかい", options: ["expensive", "short", "light", "cheap"], correctAnswerIndex: 0),
            Question(text: "低い", hiragana: "ひくい", options: ["low", "tall", "strong", "weak"], correctAnswerIndex: 0),
            Question(text: "速い", hiragana: "はやい", options: ["fast", "slow", "late", "heavy"], correctAnswerIndex: 0),
            Question(text: "遅い", hiragana: "おそい", options: ["slow", "early", "fast", "sharp"], correctAnswerIndex: 0),
            Question(text: "明るい", hiragana: "あかるい", options: ["bright", "dark", "quiet", "noisy"], correctAnswerIndex: 0),
            Question(text: "暗い", hiragana: "くらい", options: ["dark", "bright", "clean", "dirty"], correctAnswerIndex: 0),
            Question(text: "強い", hiragana: "つよい", options: ["strong", "weak", "soft", "hard"], correctAnswerIndex: 0),
            Question(text: "弱い", hiragana: "よわい", options: ["weak", "strong", "sharp", "thick"], correctAnswerIndex: 0),
            Question(text: "忙しい", hiragana: "いそがしい", options: ["busy", "free", "lazy", "sleepy"], correctAnswerIndex: 0),
            Question(text: "暇な", hiragana: "ひまな", options: ["free", "busy", "hungry", "thirsty"], correctAnswerIndex: 0),
            Question(text: "簡単な", hiragana: "かんたんな", options: ["easy", "difficult", "boring", "funny"], correctAnswerIndex: 0),
            Question(text: "難しい", hiragana: "むずかしい", options: ["difficult", "easy", "light", "simple"], correctAnswerIndex: 0),
            Question(text: "楽しい", hiragana: "たのしい", options: ["fun", "boring", "tiring", "sad"], correctAnswerIndex: 0),
            Question(text: "面白い", hiragana: "おもしろい", options: ["interesting", "boring", "ugly", "plain"], correctAnswerIndex: 0),
            Question(text: "きれいな", hiragana: "きれいな", options: ["beautiful/clean", "dirty", "noisy", "messy"], correctAnswerIndex: 0),
            Question(text: "汚い", hiragana: "きたない", options: ["dirty", "clean", "quiet", "fresh"], correctAnswerIndex: 0),
            Question(text: "危険な", hiragana: "きけんな", options: ["dangerous", "safe", "boring", "easy"], correctAnswerIndex: 0),
            Question(text: "安全な", hiragana: "あんぜんな", options: ["safe", "dangerous", "expensive", "cheap"], correctAnswerIndex: 0),
            Question(text: "静かな", hiragana: "しずかな", options: ["quiet", "noisy", "strong", "weak"], correctAnswerIndex: 0),
            Question(text: "うるさい", hiragana: "うるさい", options: ["noisy", "quiet", "soft", "silent"], correctAnswerIndex: 0),
            Question(text: "便利な", hiragana: "べんりな", options: ["convenient", "inconvenient", "expensive", "cheap"], correctAnswerIndex: 0)
        ]
        
        return questions
    }
}
