import SwiftUI

struct ScorePage: View {
    @Binding var score: Int

    var body: some View {
        NavigationStack {
            ZStack {
                Color(Color.grn)
                    .edgesIgnoringSafeArea(.all)

                Circle()
                    .fill(Color(Color.ylw))
                    .scaleEffect(1.5)
                    .offset(y: 0)

                VStack {
                    Spacer()

                    // Display images based on score
                    if score == 0 {
                        Image("0brain")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .padding()
                            .foregroundColor(.pink)
                    } else if score <= 3 {
                        Image("13brain")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .padding()
                            .foregroundColor(.yellow)
                    } else if score <= 6 {
                        Image("46brain")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .padding()
                            .foregroundColor(.blue)
                    } else if score <= 8 {
                        Image("78brain")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .padding()
                            .foregroundColor(.green)
                    } else if score <= 9 {
                        Image("9brain")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .foregroundColor(.black)
                    } else if score == 10 {
                        Image("10brain")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 160, height: 160)
                            .padding()
                            .foregroundColor(.orange)
                    }

                    // Displaying the score
                    Text("\(score) of 10")
                        .font(.system(size: 45))
                        .fontWeight(.bold)
                        .padding()

                    Spacer()

                    // NavigationLink to another page
                    NavigationLink(destination: HomePage().navigationBarBackButtonHidden(true)) {
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
                    .padding(.bottom, 100)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScorePage(score: .constant(7))
    }
}
