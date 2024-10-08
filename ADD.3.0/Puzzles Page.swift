import SwiftUI

struct PuzzlePage: View {
    @Binding var score: Int
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer: Int? = nil
    @State private var showResult = false
    @State private var showingLeaveAlert = false
    @State private var wrongAnswers: [Bool] = Array(repeating: false, count: 10)

    @Environment(\.presentationMode) var presentationMode
    let questions = [
        Question(pattern: [Image("grn t"), Image("pink c"), Image("prp s"), Image("pink c"), Image("gry s"), Image("grn t"), Image("prp s"), Image("pink s"), Image("?")],
                 options: [Image("gry t"), Image("pink c"), Image("grn s")],
                 correctAnswerIndex: 1),
        Question(pattern: [Image("pink c"), Image("gry t"), Image("prp s"), Image("grn s"), Image("grn t"), Image("gry s"), Image("grn t"), Image("gry c"), Image("?")],
                 options: [Image("pink c"), Image("gry s"), Image("grn s")],
                 correctAnswerIndex: 0),
        Question(pattern: [Image("1"), Image("2"), Image("3"), Image("4"), Image("5"), Image("6"), Image("7"), Image("8"), Image("?")],
                 options: [Image("7"), Image("1"), Image("9")],
                 correctAnswerIndex: 2),
        Question(pattern: [Image("gry t"), Image("gry s"), Image("gry c"), Image("pink t"), Image("pink s"), Image("pink c"), Image("grn t"), Image("grn s"), Image("?")],
                 options: [Image("gry s"), Image("grn c"), Image("pink c")],
                 correctAnswerIndex: 1),
        Question(pattern: [Image("grn c"), Image("gry s"), Image("pink t"), Image("pink s"), Image("grn t"), Image("gry c"), Image("gry t"), Image("pink c"), Image("?")],
                 options: [Image("grn s"), Image("pink c"), Image("gry s")],
                 correctAnswerIndex: 0),
        Question(pattern: [Image("1"), Image("7"), Image("8"), Image("4"), Image("10"), Image("6"), Image("2"), Image("3"), Image("?")],
                 options: [Image("1"), Image("5"), Image("8")],
                 correctAnswerIndex: 1),
        Question(pattern: [Image("2"), Image("4"), Image("3"), Image("10"), Image("5"), Image("6"), Image("7"), Image("8"), Image("?")],
                 options: [Image("8"), Image("7"), Image("1")],
                 correctAnswerIndex: 2),
        Question(pattern: [Image("pink s"), Image("grn c"), Image("gry t"), Image("grn t"), Image("gry s"), Image("pink c"), Image("gry c"), Image("pink t"), Image("?")],
                 options: [Image("pink s"), Image("grn s"), Image("gry t")],
                 correctAnswerIndex: 1),
        Question(pattern: [Image("grn c"), Image("pink t"), Image("gry s"), Image("grn t"), Image("pink c"), Image("gry t"), Image("grn s"), Image("pink s"), Image("?")],
                 options: [Image("grn s"), Image("pink t"), Image("gry c")],
                 correctAnswerIndex: 2),
        Question(pattern: [Image("2"), Image("3"), Image("7"), Image("4"), Image("1"), Image("5"), Image("10"), Image("8"), Image("?")],
                 options: [Image("6"), Image("7"), Image("10")],
                 correctAnswerIndex: 0)
    ]

    var body: some View {
            NavigationView {
                VStack {
                    Spacer()

                    GeometryReader { geometry in
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 10) {
                            ForEach(0..<questions[currentQuestionIndex].pattern.count, id: \.self) { index in
                                questions[currentQuestionIndex].pattern[index]
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width / 3 - 10, height: geometry.size.width / 3 - 10)
                                    .background(Color(.ylw))
                                    .cornerRadius(10)
                                    .padding(2)
                            }
                        }
                    }
                    .padding()

                    HStack(spacing: 20) {
                        ForEach(0..<3) { index in
                            Button(action: {
                                selectedAnswer = index
                                if index == questions[currentQuestionIndex].correctAnswerIndex {
                                    score += 1
                                    wrongAnswers[currentQuestionIndex] = false
                                } else {
                                    wrongAnswers[currentQuestionIndex] = true
                                }
                                nextQuestion()
                            }) {
                                questions[currentQuestionIndex].options[index]
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .background(selectedAnswer == index ? Color.gray : Color(.ylw))
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                            }
                            .disabled(selectedAnswer != nil)
                        }
                    }
                    .padding()

                    Spacer()

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
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color(.blu)))
                            }
                        }
                        Spacer()
                        Text(currentQuestionIndex == questions.count - 1 ? "**End**" : "**>**")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 100, height: 40)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color(.blu)))
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

                    NavigationLink(destination: ViewAnswer(wrongAnswers: $wrongAnswers), isActive: $showResult) {
                        EmptyView()
                    }
                }
                .background(Color(.grn))
                .navigationTitle("")
                .navigationBarItems(leading: Button(action: {
                    showingLeaveAlert = true
                }) {
                    Text("**Leave**")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 100, height: 40)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color(.blu)))
                })
                .alert(isPresented: $showingLeaveAlert) {
                    Alert(
                        title: Text("Leave Game?"),
                        message: Text("you will lose all your progress"),
                        primaryButton: .destructive(Text("Leave")) {
                            score = 0
                            presentationMode.wrappedValue.dismiss()
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
            wrongAnswers = Array(repeating: false, count: 10)
        }
    }

    struct Question {
        let pattern: [Image]
        let options: [Image]
        let correctAnswerIndex: Int
    }

    #Preview {
        PuzzlePage(score: .constant(0))
    }
