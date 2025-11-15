//
//  ContentView.swift
//  w10_lesson
//
//  Created by natalee chen on 07/11/2025.
//

import SwiftUI

struct ContentView: View {
   
    @State private var questions: [Question] = []

    @State private var correctCount: Int = 0
    
    @State private var showHiragana: Bool = true

    @State private var currentIndex: Int = 0
    
    @State private var isComplete: Bool = false

    @State private var hasAnsweredCurrent: Bool = false
    
    private func addCorrect() {
        correctCount += 1
    }
    
    private func resetScore() {
        correctCount = 0
    }
    
    // scoring
    private var scoreValue: Int {
        let pointsPerQuestion = 10.0
        return Int(round(Double(correctCount) * pointsPerQuestion))
    }
    
    private var scoreText: String {
        "\(scoreValue) / 100"
    }
    
    private var questionIndexText: String {
        "\(currentIndex + 1) of 10"
    }
    
    private func advanceOrFinish() {
        // If already completed, do nothing
        if isComplete { return }
        
        if currentIndex < 9 {
            currentIndex += 1
            hasAnsweredCurrent = false // reset for next question
        } else {
            isComplete = true
        }
    }
    
    private func buildRoundQuestions() {
        var bank = QuestionsBank.provide()
        bank.shuffle()
        let picked = Array(bank.prefix(10))
        
        // Shuffle options for each question
        questions = picked.map { q in
            let originalCorrect = q.options[q.correctAnswerIndex]
            let shuffledOptions = q.options.shuffled()
            let newCorrectIndex = shuffledOptions.firstIndex(of: originalCorrect) ?? 0
            return Question(
                text: q.text,
                hiragana: q.hiragana,
                options: shuffledOptions,
                correctAnswerIndex: newCorrectIndex
            )
        }
        hasAnsweredCurrent = false
    }
    
    private func retake() {
        resetScore()
        isComplete = false
        currentIndex = 0
        buildRoundQuestions()
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.babyBlue)
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    // Header
                    HStack {
                        // Score pill
                        HStack(spacing: 8) {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            Text(scoreText)
                                .font(.headline)
                                .monospacedDigit()
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(.ultraThinMaterial)
                        .clipShape(Capsule())
                        
                        Spacer()
                        
                        // Progress pill
                        HStack(spacing: 8) {
                            Image(systemName: "list.number")
                                .foregroundStyle(.secondary)
                            Text(questionIndexText)
                                .font(.subheadline)
                                .monospacedDigit()
                                .foregroundStyle(.secondary)
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(.ultraThinMaterial)
                        .clipShape(Capsule())
                    }
                    
                    // Toggle
                    Toggle(isOn: $showHiragana) {
                        Text("Show Hiragana")
                    }
                    .toggleStyle(.switch)
                    .tint(.accentColor)
                    .padding(.top, 2)
                    
                    Spacer(minLength: 0)
                    
                    if isComplete {
                        // Completion view
                        VStack(spacing: 16) {
                            Image(systemName: "checkmark.seal.fill")
                                .font(.system(size: 48, weight: .bold))
                                .foregroundStyle(.green)
                                .padding(.bottom, 4)
                            
                            Text("Quiz Complete")
                                .font(.title2).bold()
                            
                            Text("Your Score: \(scoreText)")
                                .font(.title3)
                                .foregroundStyle(.secondary)
                            
                            Button {
                                retake()
                            } label: {
                                Text("Retake Test")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.accentColor)
                            .controlSize(.large)
                            .padding(.top, 6)
                        }
                        .padding(24)
                        .frame(maxWidth: 560)
                        .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color: .black.opacity(0.06), radius: 20, x: 0, y: 10)
                        
                    } else if questions.indices.contains(currentIndex) {
                        // Question card
                        VStack(alignment: .leading, spacing: 16) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text(questions[currentIndex].text)
                                    .font(.title3.weight(.semibold))
                                if showHiragana {
                                    Text(questions[currentIndex].hiragana)
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            
                            QuestionView(
                                question: questions[currentIndex],
                                showHiragana: showHiragana,
                                onCorrect: {
                                    //when user picks the correct answer
                                    addCorrect()
                                },
                                answered: $hasAnsweredCurrent
                            )
                            .id(questions[currentIndex].id) // reset per question
                            
                            // Next button (enabled after answering)
                            NextButton(
                                isEnabled: hasAnsweredCurrent,
                                isLast: currentIndex == 9,
                                onTap: {
                                    advanceOrFinish()
                                }
                            )
                        }
                        .padding(20)
                        .frame(maxWidth: 560)
                        .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color: .black.opacity(0.06), radius: 20, x: 0, y: 10)
                        .transition(.opacity.combined(with: .scale))
                        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: currentIndex)
                        
                    } else {
                        // Fallback if index is out of range
                        Text("No questions available.")
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding()
            }
            .navigationTitle("Cardly")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            // 10 questions per round
            buildRoundQuestions()
        }
    }
}

//Next Button 
private struct NextButton: View {
    let isEnabled: Bool
    let isLast: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            Text(isLast ? "Finish" : "Next")
                .font(.headline)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .tint(.accentColor)
        .controlSize(.large)
        .opacity(isEnabled ? 1 : 0.5)
        .disabled(!isEnabled)
    }
}

#Preview {
    ContentView()
}
