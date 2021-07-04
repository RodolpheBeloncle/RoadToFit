//
//  ContentView.swift
//  Interface3
//
//  Created by Drobkov Nikita on 23/06/2021.
//

import SwiftUI

enum EtatTimer {
    case initial
    case enCours
    case terminé
}

struct SeanceView: View {
    @State var etat: EtatTimer = .initial
    @State var timeRemaining = 3
    @State private var sliderValue = 0.0
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common)
    
    @State  var seance:[Exercice]
    @State var seance2:[Exercice]
    
    
    @State  var indexExercice:Int = 0
    
    @State var motivation: String = phrases.randomElement()!
    
    var body: some View {
        
            VStack{
                HStack{
                    Text("Exercices Complets")
                        .bold()
                        .padding()
                        .frame(width: 400, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(.white)
                    Spacer()
                }
                Spacer()
                ZStack{
                    VStack{
                        HStack{
                            ZStack{
                                Circle()
                                    .frame(width: 80, height: 100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center)
                                    .foregroundColor(.blue)
                                    .padding()
                                HStack{
                                    Text("\(timeRemaining)")
                                        .onReceive(timer) { _ in
                                            if timeRemaining > 0 {
                                                timeRemaining -= 1
                                            }
                                            else {
                                                etat = .terminé
                                            }
                                        }
                                        .font(.system(size: 30))
                                        .foregroundColor(.white)
                                }
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                    Spacer()
                  
                    Image("top-heroe")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 230, height: 230, alignment: .center)
                        .clipShape(Circle())
                }
                .frame(width: 400, height: 300, alignment: .center)
                Spacer()
                VStack{
                    HStack{
                        
                        Text("\(seance[indexExercice].exerciceName)")
                            .padding()
                        Text("\(seance[indexExercice].chargeKg) kg")
                            .font(.title)
                            .bold()
                            .foregroundColor(.orange)
                        Text("\(seance[indexExercice].nbRepetition) séries")
                            .font(.title)
                            .bold()
                            .foregroundColor(.orange)
                }
                    
                    Slider(value: $sliderValue, in:0...100)
                        .padding()
                    HStack{
                        Text(motivation)
                    }
                    Spacer()
                }
                HStack{
                    if etat == .initial {
                        Button("COMMENCER") {
                            etat = .enCours
                            timer.connect()
                           
                        }
                        .padding()
                        .frame(width: 200, height: 100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        
                    
                    }
                    else if etat == .enCours {
                        Text("C'est parti !")
                            .padding()
                            .frame(width: 200, height: 100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    } else  {
                        Button(" Exercice Suivant") {
                            etat = .initial
                            motivation = phrases.randomElement()!
                            timer = Timer.publish(every: 1, on: .main, in: .common)
                            sliderValue += 37.5
                            indexExercice += 1
                            timeRemaining = seance[indexExercice].temps
                        }
                        .padding()
                        .frame(width: 200, height: 100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                    }
                     if sliderValue >= 100 && etat == .enCours {
                        
                        Text("C'est parti !")
                            .padding()
                            .frame(width: 200, height: 100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                           
                            
                        }
                    
                        
                        
                    
                }
            }
        
    }
}

struct SeanceView_Previews: PreviewProvider {

    static var previews: some View {
        SeanceView(seance: exerciceList1, seance2: exerciceList2)
           
            .previewDevice("iPhone 12")
    }
}
