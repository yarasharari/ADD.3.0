import SwiftUI

struct ViewAnswer: View {
    @Binding var wrongAnswers: [Bool] // Binding to track wrong answers
    var data: [Int] = Array(1...10)

    let adaptiveColumn = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.ylw).ignoresSafeArea()
                VStack {
                    Spacer()
                    
                    HStack {
                        Text("**View Answers**")
                            .font(.title)
                            .foregroundColor(Color(.black))
                            .multilineTextAlignment(.center)
                            .padding(3.0)
                        
                        Image("VA")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    
                    VStack {
                        ScrollView {
                            LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                                ForEach(data, id: \.self) { index in
                                    ZStack {
                                        Rectangle()
                                            .padding(5.0)
                                            .frame(width: 150, height: 150)
                                            .foregroundColor(wrongAnswers[index - 1] ? Color.red : Color(.grn)) // Change color if wrong
                                            .cornerRadius(40)
                                            .shadow(radius: 5)

                                        // Display the BabyBrain image
                                        Image("BabyBrain")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .offset(y: -10)

                                        Text("\(index)")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color(.black))
                                            .offset(y: 40)
                                    }
                                }
                            }
                        }
                        
                        // NavigationLink to existing HomePage
                    }
                }
            }
        }
    }
}

struct ViewAnswer_Previews: PreviewProvider {
    static var previews: some View {
        ViewAnswer(wrongAnswers: .constant(Array(repeating: false, count: 10))) // Provide a default binding for preview
    }
}
