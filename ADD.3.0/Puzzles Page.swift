//
//  Puzzles Page.swift
//  ADD.3.0
//
//  Created by Yara Alsharari on 03/04/1446 AH.
//

//
//  Puzzle Page By Nora.swift
//  ADD.2.0
//
//  Created by Nora on 05/10/2024.
//

import SwiftUI
// here is state
struct PuzzlePage: View {
    
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer: Int? = nil
    @State private var score = 0
    @State private var showResult = false

    // assets to actual images for sahar and shahad
    let questions = [
        Question(pattern: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], options: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], correctAnswerIndex: 0),
        Question(pattern: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], options: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], correctAnswerIndex: 1),
        Question(pattern: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], options: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], correctAnswerIndex: 1),
        Question(pattern: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], options: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], correctAnswerIndex: 1),
        Question(pattern: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], options: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], correctAnswerIndex: 1),
        Question(pattern: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], options: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], correctAnswerIndex: 0),
        Question(pattern: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], options: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], correctAnswerIndex: 0),
        Question(pattern: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], options: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], correctAnswerIndex: 0),
        Question(pattern: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], options: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], correctAnswerIndex: 2),
        Question(pattern: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], options: [Image("BabyBrain"), Image("BabyBrain"), Image("BabyBrain")], correctAnswerIndex: 0)
    ]

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                // Q grids
                GeometryReader { geometry in
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 10) {
                        ForEach(0..<9, id: \.self) { index in
                            if index < 9 {
                                questions[currentQuestionIndex].pattern[index]
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width / 3 - 10, height: geometry.size.width / 3 - 10) // q to big squares
                                    .background(Color.ylw)
                                    .cornerRadius(10)
                                    .padding(2)
                            } else {
                                Text("") // placeholder for empty slot
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.clear)
                            }
                        }
                    }
                }
                .padding()

                // A grids
                HStack(spacing: 20) {
                    ForEach(0..<3) { index in
                        Button(action: {
                            selectedAnswer = index
                            if index == questions[currentQuestionIndex].correctAnswerIndex {
                                score += 1
                            }
                            nextQuestion()
                        }) {
                            questions[currentQuestionIndex].options[index]
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100) // answers options to big squares
                                .background(selectedAnswer == index ? Color.gray : Color.ylw)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                        .disabled(selectedAnswer != nil)
                    }
                }
                .padding()

                Spacer()

                // navigation arrows
                HStack {
                    if currentQuestionIndex > 0 {
                        Button(action: {
                            currentQuestionIndex -= 1
                            selectedAnswer = nil
                        }) {
                            Text("**<**")
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                                .padding()
                                .frame(width: 100, height: 40)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.blu)
                                        .shadow(color: Color.gray.opacity(0), radius: 10, x: 0, y: 4)
                                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 1, y: 4)
                                )
                        }
                    }
                    Spacer()
                    Text(currentQuestionIndex == questions.count - 1 ? "**End**" : "**>**")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 100, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.blu)
                                .shadow(color: Color.gray.opacity(0), radius: 10, x: 0, y: 4)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 1, y: 4)
                        )
                        .onTapGesture {
                            if currentQuestionIndex < questions.count - 1 {
                                currentQuestionIndex += 1
                                selectedAnswer = nil
                            } else {
                                showResult = true
                            }
                        }
                }
                .padding()

                Text("\(currentQuestionIndex + 1) of \(questions.count)")
                    .font(.headline)
                    .padding()
            }
            .background(Color.grn)
            .navigationTitle("")
            .navigationBarItems(leading: Button(action: {
                // button to leave the game back to home screen
            }) {
                Text("**Leave**")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 100, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blu)
                            .shadow(color: Color.gray.opacity(0), radius: 10, x: 0, y: 4)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 1, y: 4)
                    )
            })
            .alert(isPresented: $showResult) {
                Alert(title: Text("يودي صفحه جود"),
                      dismissButton: .default(Text("OK"), action: {
                          resetGame()
                      })
                )
            }
        }
        .onAppear {
            resetGame()
        }
    }

    func nextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            selectedAnswer = nil
        } else {
            showResult = true
        }
    }

    func resetGame() {
        currentQuestionIndex = 0
        score = 0
        selectedAnswer = nil
    }
}

struct Question {
    let pattern: [Image]
    let options: [Image]
    let correctAnswerIndex: Int
}

struct IQPuzzleGameApp: App {
    var body: some Scene {
        WindowGroup {
            PuzzlePage()
        }
    }
}

#Preview {
    PuzzlePage()
}
