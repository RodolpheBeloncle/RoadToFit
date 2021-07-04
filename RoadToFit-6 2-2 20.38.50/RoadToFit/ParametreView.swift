//
//  ContentView.swift
//  ChoixLevelView
//
//  Created by Nkindanda on 23/06/2021.
//

import SwiftUI

struct ParametreView: View {
    // binding value to mainview
    @Binding var niveauSelection:Int
    @Binding  var seanceSelection:Int
    
    var body: some View {
        
       
            Form{
                Section {
                    Picker("Choix niveau", selection : $niveauSelection) {
                        Text("Débutant").tag(1)
                        Text("Intermediaire").tag(2)
                        Text("Difficile").tag(3)
                      
                    }.padding()
                    
                }
                Section {
                    Picker("Choix séances", selection: $seanceSelection) {
                        HStack {
                            Image(systemName: "1.circle.fill")
                                .foregroundColor(.yellow)
                            Text("séance")
                        }.tag(1)
                        HStack {
                            Image(systemName: "2.circle.fill")
                                .foregroundColor(.blue)
                            Text("séances")
                        }.tag(2)
                        HStack {
                            Image(systemName: "3.circle.fill")
                                .foregroundColor(.purple)
                            Text("séances")
                        }.tag(3)
                        HStack {
                            Image(systemName: "4.circle.fill")
                                .foregroundColor(.green)
                            Text("séances")
                        }.tag(4)
                     
                    }.padding()
                    
                    
                }
            }.navigationTitle("Paramètres")
            
        }

        
    }


struct Parametre_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ParametreView(niveauSelection:.constant(1),seanceSelection: .constant(3) )
    }
}
