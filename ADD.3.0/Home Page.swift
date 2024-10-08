import SwiftUI

struct HomePage: View {
    @Binding var score: Int // Bind the score from PuzzlePage

    var body: some View {
        NavigationView {
            ZStack {
                Color(.grn)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Rectangle()
                        .fill(Color(.ylw))
                        .frame(width: 380, height: 500)
                        .cornerRadius(35)
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 1, y: 4)
                        .offset(y: -70)
                    Circle()
                        .fill(Color(.ylw))
                        .blur(radius: 50)
                        .offset(y: 130)
                }
                
                VStack {
                    // Determine image and message based on score
                    let imageName = getImageName(for: score)
                    let message = getMessage(for: score)

                    // Apply offsets based on score
                    let offsetY: CGFloat = (score == 7 || score == 8) ? -50 : 0

                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 1200, height: 200)
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 1, y: 2)
                        .padding(.top, 145)
                        .offset(y: offsetY) // Apply offset

                    Text("**Status**")
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 83/255, green: 82/255, blue: 80/255))
                        .offset(y: offsetY) // Apply offset

                    Text("**\(message)**")
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 83/255, green: 82/255, blue: 80/255))
                        .offset(y: offsetY) // Apply offset for the message

                    Spacer()

                    // NavigationLink to PuzzlePage
                    NavigationLink(destination: PuzzlePage(score: $score).navigationBarBackButtonHidden(true)) {
                        Text("**Start**")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 100, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(.blu))
                                    .shadow(color: Color.gray.opacity(0), radius: 10, x: 0, y: 4)
                                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 1, y: 4)
                            )
                    }
                }
                .padding(.top, 10) // Add some padding at the top
            }
            .navigationBarBackButtonHidden(true)
        }
    }

    private func getImageName(for score: Int) -> String {
        switch score {
        case 0: return "BabyBrain" // baby
        case 1...3: return "13brainy" // confused
        case 4...6: return "46brainy" // idk man
        case 7...8: return "78brainy" // you're getting the hang of it!
        case 9: return "9brainy" // almost there..
        case 10: return "10brainy" // wise!
        default: return "BabyBrain" // baby
        }
    }

    private func getMessage(for score: Int) -> String {
        switch score {
        case 0: return "baby"
        case 1...3: return "confused"
        case 4...6: return "learning"
        case 7...8: return "you're getting\n the hang of it!"
        case 9: return "almost there.."
        case 10: return "wise!"
        default: return "baby"
        }
    }
}

#Preview {
    HomePage(score: .constant(0)) // Provide a default score for preview
}

