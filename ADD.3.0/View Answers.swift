import SwiftUI

struct ViewAnswer: View {
    @Binding var wrongAnswers: [Bool] // track wrong answers
    @Binding var score: Int // Property to receive the score
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
                            .padding(10)
                        
                        Image("VA")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    
                    // Display the score at the top
                    Text("Your Score: \(score)")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()

                    VStack {
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                                ForEach(0..<wrongAnswers.count, id: \.self) { index in
                                    ZStack {
                                        Rectangle()
                                            .padding(5)
                                            .frame(width: 160, height: 160)
                                            .foregroundColor(wrongAnswers[index] == true ? Color.redd : Color.grn) // Change color if wrong
                                            .cornerRadius(20)
                                            .shadow(radius: 5)

                                        Image("\(index + 1)Q") // Display question number
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 120, height: 120)
                                            .padding(20).shadow(radius: 5)
                                        
                                        Circle().fill(Color.grn).frame(width: 50, height: 50).shadow(radius: 5).offset(x: -70, y: -65)
 
                                        Text("\(index + 1)")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.black).offset(x: -70, y: -65)
                                    }
                                }
                            }
                            .padding() // Add padding around the grid
                        }
                        
                        // Home Button with NavigationLink
                        NavigationLink(destination: HomePage(score: $score).navigationBarBackButtonHidden(true)) {
                            Text("**Home**")
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                                .padding()
                                .frame(width: 100, height: 40)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color(red: 230/255, green: 240/255, blue: 245/255))
                                        .shadow(color: Color.gray.opacity(0.4), radius: 10, x: 0, y: 4)
                                )
                        }
                        .padding(.bottom, 10)// Add some space above the button
                    }
                }
                .padding() // Additional padding for the VStack
            }
        }
        .navigationBarBackButtonHidden(true) // Hide the back button
    }
}

struct ViewAnswer_Previews: PreviewProvider {
    static var previews: some View {
        ViewAnswer(wrongAnswers : .constant(Array(repeating: false, count: 10)),score: .constant(10))
    }
}
