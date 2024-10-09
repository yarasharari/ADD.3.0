import SwiftUI

struct ViewAnswer: View {
    @Binding var wrongAnswers: [Bool] // track wrong answers
    var score: Int // Property to receive the score

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
                                            .foregroundColor(wrongAnswers[index] ? Color.redd : Color.grn) // Change color if wrong
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
                        NavigationLink(destination: HomePage(score: .constant(0)).navigationBarBackButtonHidden(true)) {
                            Text("**Home**")
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
                        }
                        .padding(.top, 20) // Add some space above the button
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
        ViewAnswer(wrongAnswers: .constant([false, true, false, true, false, false, true, false, false, true]), score: 6) // Example score and wrong answers
    }
}
