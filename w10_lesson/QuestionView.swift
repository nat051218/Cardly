//
//  QuestionView.swift
//  w10_lesson
//
//  Created by natalee chen on 15/11/2025.
//

import SwiftUI

struct QuestionView: View {
    let question: Question
    let showHiragana: Bool
    
    // when the user chooses the correct answer
    var onCorrect: () -> Void
    
    @Binding var answered: Bool
    
    @State private var selectedIndex: Int? = nil
    
    @State private var isAnswered = false
    
    @State private var didReportCorrect = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(question.options.indices, id: \.self) { index in
                Button {
                    if !isAnswered {
                        withAnimation(.easeInOut(duration: 0.15)) {
                            selectedIndex = index
                            isAnswered = true
                            answered = true
                        }
                        if index == question.correctAnswerIndex && !didReportCorrect {
                            didReportCorrect = true
                            onCorrect()
                        }
                    }
                } label: {
                    HStack(spacing: 12) {
                        Text(question.options[index])
                            .frame(maxWidth: .infinity, alignment: .leading)
                        if isAnswered && index == question.correctAnswerIndex {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.green)
                        } else if isAnswered && index == selectedIndex && index != question.correctAnswerIndex {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.red)
                        }
                    }
                    .font(.body)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 14)
                    .background(backgroundColor(for: index))
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .strokeBorder(borderColor(for: index), lineWidth: 1)
                    )
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .disabled(isAnswered)
                .animation(.easeInOut(duration: 0.15), value: isAnswered)
            }
            
            if isAnswered {
                if selectedIndex == question.correctAnswerIndex {
                    Label("Correct", systemImage: "hand.thumbsup.fill")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(.green)
                        .padding(.top, 6)
                } else {
                    HStack(spacing: 6) {
                        Text("Answer:")
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(.secondary)
                        Text(question.options[question.correctAnswerIndex])
                            .font(.subheadline)
                    }
                    .padding(.top, 6)
                }
            }
        }
        // Reset UI
        .onChange(of: question.id) { _, _ in
            selectedIndex = nil
            isAnswered = false
            didReportCorrect = false
        }
    }
    
    //option colors
    private func backgroundColor(for index: Int) -> Color {
        if !isAnswered {
            return Color(.systemGray6)
        }
        if index == question.correctAnswerIndex {
            return Color.green.opacity(0.18)
        }
        if index == selectedIndex {
            return Color.red.opacity(0.16)
        }
        return Color(.systemGray6)
    }
    
    private func borderColor(for index: Int) -> Color {
        if !isAnswered { return Color(.quaternaryLabel) }
        if index == question.correctAnswerIndex { return .green.opacity(0.6) }
        if index == selectedIndex { return .red.opacity(0.6) }
        return Color(.quaternaryLabel)
    }
}
