//
//  SeanceView.swift
//  RoadToFit
//
//  Created by Nkindanda on 22/06/2021.
//

import SwiftUI

struct ProfilView: View {
    
    @State private var progressValueBlueEnd:CGFloat =  0.0
    @State private var progressValueWhiteEnd:CGFloat =  0.0
    @State private var formatProgressValue:Double = 100
    @State private var evolutionValue:Double = 0
    @State private var reachedLevel:Double = 0
    
    @State var niveau:String = "Niveau Inital"
    
    //Timer
    @State private var isActive = true
    @State private var timeRemaining = 1
    let timer = Timer.publish(every:1, on: .main, in:.common).autoconnect()
    
    var body: some View {
        
            ScrollView {
                VStack{
                    VStack {
                        HStack{
                            Spacer()
                            
                            //*** Votre Evolution % ***
                            
                            
                            Text("Votre Evolution : \(evolutionValue,specifier: "%.0f") %")
                                .bold()
                                .multilineTextAlignment(.center)
                                .frame(width: 350, height: 50, alignment: .center)
                                .foregroundColor(Color.white)
                                .background(Color.blue)
                                .cornerRadius(5)
                                .padding()
                            
                            
                            Spacer()
                        }
                    }
                    
                    
                    
                    //*** Circle Progress Bar ***
                    
                    
                    
                    
                    VStack {
                        ZStack{
                            Circle()
                                .trim(from: 0.0, to: progressValueBlueEnd)
                                .stroke(lineWidth: 30.0)
                                .opacity(0.9)
                                .foregroundColor(Color.orange)
                                .rotationEffect(Angle(degrees:270.0))
                            
                            Circle()
                            Image("top-heroe")
                                
                                .resizable()
                                .frame(width:200,height: 200)
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(300)
                        }
                        .padding()
                        
                    }
                    
                    //*** Niveau ***
                    VStack{
                        HStack{
                            if reachedLevel == 0{
                                Text("\(niveau)")
                                    .font(.system(size: 20))
                                    .lineLimit(2)
                                    .frame(width:140.0,height: 33.0)
                            }else{
                                Text("NIVEAU \(reachedLevel,specifier: "%.0f")")
                                    .bold()
                                    .padding()
                                    .font(.system(size: 20))
                                    .lineLimit(2)
                                    .frame(width:140.0,height: 33.0)
                                    
                            }
                        }
                        
                        .padding()
                        Divider()
                        
                        
                        
                        //*** Evolution Physique ***
                        VStack{
                            Text("Evolution Physique")
                                .bold()
                                .frame(width: 350, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(Color.orange)
                                .cornerRadius(5)
                                .foregroundColor(.white)
                                
                        }
                        .padding()
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack(spacing: 5){
                                EvolutionPhysiqueView(imageUrl: "ExDosView")
                                EvolutionPhysiqueView(imageUrl: "ExBrasView")
                                    EvolutionPhysiqueView(imageUrl: "top-heroe")
                                    EvolutionPhysiqueView(imageUrl: "ExBrasView")
                                    EvolutionPhysiqueView(imageUrl: "ExAbdosView")
                            }
                            
                            .padding()
                            Spacer()
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }

                        
                        //***  Bouton Validation Progression ***
                        HStack{
                            
                            Button(action:{
                                if timeRemaining == 0{
                                    
                                    progressValueWhiteEnd += 0.05
                                    
                                    progressValueBlueEnd += 0.05
                                    
                                    evolutionValue = (Double(progressValueBlueEnd)) * formatProgressValue
                                    
                                    
                                    
                                }
                                
                                
                                if evolutionValue > 100 {
                                    // *******
                                    evolutionValue = 100
                                    progressValueBlueEnd = 0
                                    progressValueWhiteEnd = 0
                                    //*******
                                    reachedLevel += 1
                                }
                                
                            }, label: {
                                Text("Valider Votre Niveau")
                                    .bold()
                                    .lineLimit(2)
                                    .frame(width: 200, height:40)
                                    .padding()
                                    .background(Color.orange)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    
                            })
                        }
                        .navigationTitle("Profil")
                    }
                    
                }
            }
            .onReceive(timer){ time in
                if self.timeRemaining > 0{
                    self.timeRemaining -= 1
                }
                
            }.onReceive(NotificationCenter.default.publisher(for:UIApplication.willResignActiveNotification)){ _ in
                self.isActive = false
                
            }
            
        
        
    }
    
    
}


struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
struct TypeButton: View {
    // set value Button
    
    let text : String
    
    var body: some View {
        Button(action: {}) {
            Text(text)
                .lineLimit(2)
                .frame(width: 150, height:30)
                .font(.footnote)
                .padding()
                .background(Color.blue)
                .cornerRadius(40)
                .foregroundColor(.white)
                .border(Color.orange, width: 5)
            
            
            
        }
    }
}






struct ConteurLevel: View {
    @Binding var reachedLevel:Double
    var body: some View {
        HStack{
            Text("\(reachedLevel)")
                .font(.system(size: 30))
                .lineLimit(2)
                .frame(width:140.0,height: 33.0)
                .border(Color.blue,width:1)
        }
    }
}

struct EvolutionPhysiqueView: View {
    var imageUrl:String
    var body: some View {
        
        Image(imageUrl)
            .resizable()
            .frame(width: 100, height:100)
            .aspectRatio(contentMode: .fill)
            .border(Color.gray)
            .cornerRadius(7)
        
        
        
        
        
    }
}
