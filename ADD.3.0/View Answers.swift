import SwiftUI

struct viewAnswer: View {
    var data : [Int] = Array(1...10)
    
    let adaptivecolumn = [GridItem(.adaptive(minimum: 150))]
    let numberColumns = [GridItem(.flexible())]
    var body: some View {
        
        ZStack{
            Color(.ylw).ignoresSafeArea()
            VStack{
                
                Spacer()
                
                HStack{
                    
                    Text("**View Answers**")
                        .font(.title)
                        .foregroundColor(Color(.black))
                        .multilineTextAlignment(.center)
                        .padding(3.0)
                    
                    Image("VA").resizable().frame(width: 100, height: 100.0)}
                    VStack{
                        ScrollView{
                            
                            LazyVGrid(columns:adaptivecolumn,spacing:20){
                                ForEach(data,id: \.self){number in
                                    ZStack{
                                        Rectangle()
                                            .padding(5.0)
                                            .frame(width: 150,height: 150).foregroundColor(Color(.grn)).cornerRadius(40).shadow(radius: 5)
                                        Text("\(number)")
                                            .font(.title).fontWeight(.bold).offset(x:-45,y:-45).foregroundColor(Color(.black))
                                            
                                           
                                            
                                       
                                           
                                        
                                        
                                    }
                                }
                            }
                            
                           
                        }
                        Button("**Home**") {
                            
                        }
                        .font(.system(size: 20))
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
        
    }
       
 
        
        
    

        
        
        
       
        
}
    

struct onboarding : PreviewProvider{
    static var previews: some View{
        viewAnswer()
    }
}

