import SwiftUI

struct HomePage: View {
    
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
                        .blur(radius: 40)
                        .offset(y: 130)
                }
                VStack {
                    Image("BabyBrain")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 1200, height: 200)
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 1, y: 2)
                        .padding(.top, 145)

                    Text("**Status**")
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 83/255, green: 82/255, blue: 80/255))

                    Text("**baby!**")
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 83/255, green: 82/255, blue: 80/255))

                    Spacer()

                    // NavigationLink to PuzzlePage
                    NavigationLink(destination: PuzzlePage().navigationBarBackButtonHidden(true)) {
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
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    HomePage()
}
