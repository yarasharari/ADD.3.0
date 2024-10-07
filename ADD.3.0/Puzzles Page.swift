import SwiftUI

struct PuzzlePage: View {
    @State private var score: Int = 0
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer: Int? = nil
    @State private var showResult = false
    @State private var showingLeaveAlert = false

    @Environment(\.presentationMode) var presentationMode // Dismiss the view

    // Assets to actual images for sahar and shahad
    let questions = [
        Question(pattern: [Image("grn t"), Image("pink c"), Image("prp s"), Image("pink c"), Image("gry s"), Image("grn t"), Image("prp s"), Image("pink s"), Image("?")], options: [Image("gry t"), Image("pink c"), Image("grn s")], correctAnswerIndex: 1),
        Question(pattern: [Image("pink c"), Image("gry t"), Image("prp s"), Image("grn s"), Image("grn t"), Image("gry s"), Image("grn t"), Image("gry c"), Image("?")], options: [Image("pink c"), Image("gry s"), Image("grn s")], correctAnswerIndex: 0),
        Question(pattern: [Image("1"), Image("2"), Image("3"), Image("4"), Image("5"), Image("6"), Image("7"), Image("8"), Image("?")], options: [Image("7"), Image("1"), Image("9")], correctAnswerIndex: 2),
        Question(pattern: [Image("gry t"), Image("gry s"), Image("gry c"), Image("pink t"), Image("pink s"), Image("pink c"), Image("grn t"), Image("grn s"), Image("?")], options: [Image("gry s"), Image("grn c"), Image("pink c")], correctAnswerIndex: 1),
        Question(pattern: [Image("grn c"), Image("gry s"), Image("pink t"), Image("pink s"), Image("grn t"), Image("gry c"), Image("gry t"), Image("pink c"), Image("?")], options: [Image("grn s"), Image("pink c"), Image("gry s")], correctAnswerIndex: 0),
        Question(pattern: [Image("1"), Image("7"), Image("8"), Image("4"), Image("10"), Image("6"), Image("2"), Image("3"), Image("?")], options: [Image("1"), Image("5"), Image("8")], correctAnswerIndex: 1),
        Question(pattern: [Image("2"), Image("4"), Image("3"), Image("10"), Image("5"), Image("6"), Image("7"), Image("8"), Image("?")], options: [Image("8"), Image("7"), Image("1")], correctAnswerIndex: 2),
        Question(pattern: [Image("pink s"), Image("grn c"), Image("gry t"), Image("grn t"), Image("gry s"), Image("pink c"), Image("gry c"), Image("pink t"), Image("?")], options: [Image("pink s"), Image("grn s"), Image("gry t")], correctAnswerIndex: 1),
        Question(pattern: [Image("grn c"), Image("pink t"), Image("gry s"), Image("grn t"), Image("pink c"), Image("gry t"), Image("grn s"), Image("pink s"), Image("?")], options: [Image("grn s"), Image("pink t"), Image("gry c")], correctAnswerIndex: 2),
        Question(pattern: [Image("2"), Image("3"), Image("7"), Image("4"), Image("1"), Image("5"), Image("10"), Image("8"), Image("?")], options: [Image("6"), Image("7"), Image("10")], correctAnswerIndex: 0)
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
                                    .background(Color.ylw) // Original color
                                    .cornerRadius(10)
                                    .padding(2)
                            } else {
                                Text("") // Placeholder for empty slot
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
                                .frame(width: 100, height: 100) // Answers options to big squares
                                .background(selectedAnswer == index ? Color.gray : Color.ylw) // Original color
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                        .disabled(selectedAnswer != nil)
                    }
                }
                .padding()

                Spacer()

                // Navigation arrows
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
                                        .fill(Color.blu) // Original color
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
                                .fill(Color.blu) // Original color
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

                // NavigationLink to ScorePage
                NavigationLink(destination: ScorePage(score: $score), isActive: $showResult) {
                    EmptyView()
                }
            }
            .background(Color.grn) // Original color
            .navigationTitle("")
            .navigationBarItems(leading: Button(action: {
                showingLeaveAlert = true // Show alert when button is tapped
            }) {
                Text("**Leave**")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 100, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blu) // Original color
                            .shadow(color: Color.gray.opacity(0), radius: 10, x: 0, y: 4)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 1, y: 4)
                    )
            })
            .alert(isPresented: $showingLeaveAlert) {
                Alert(
                    title: Text("Leave Game"),
                    message: Text("Are you sure you want to leave the game?"),
                    primaryButton: .destructive(Text("Leave")) {
                        presentationMode.wrappedValue.dismiss() // Dismiss the current view
                    },
                    secondaryButton: .cancel()
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
            HomePage() // Ensure this is the entry point
        }
    }
}

#Preview {
    PuzzlePage()
}

