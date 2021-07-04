//
//  BaseDeDonnees.swift
//  RoadToFit
//
//  Created by Nkindanda on 22/06/2021.
//

import Foundation


//interface 3

struct Exercice {
    var id = UUID()
    var imageGifUrl: String
    var exerciceName: String
    var temps:Int
    let nbRepetition : Int
    let chargeKg: Int
    
  
    
   
    
}


//                    Liste Exercice Niveau 1

//***** Exercice liste Seance Complète *****

var exerciceList1 = [exBras,exJambes,exEpaules,exDosRowing,exDosTirage]

//***** Exercice liste Seance Haut Du Corps *****
var exerciceList2 = [exBras,exEpaules,exAbdos]

//***** Exercice liste Seance Dos *****
var exerciceList3 = [exDosRowing,exDosTirage,exDosTraction]

//***** Exercice liste Seance Jambes *****
var exerciceList4 = [exJambes]

// Haut Du Corps
var exBras = Exercice(imageGifUrl: "", exerciceName: "Biceps", temps: 3, nbRepetition: 12, chargeKg: 8)
var exEpaules = Exercice(imageGifUrl: "", exerciceName: "Développé Epaules", temps: 3, nbRepetition: 10, chargeKg: 4)

// Jambes
var exJambes = Exercice(imageGifUrl: "", exerciceName: "legs Extension", temps: 3, nbRepetition: 20, chargeKg: 15)

// Dos
var exDosRowing = Exercice(imageGifUrl: "", exerciceName: "Rowing Yates", temps: 3, nbRepetition: 8, chargeKg: 10)
var exDosTirage = Exercice(imageGifUrl: "", exerciceName: "Tirage Haut à la Poulie", temps: 3, nbRepetition: 8, chargeKg: 10)
var exDosTraction = Exercice(imageGifUrl: "", exerciceName: "Traction à la machine Convergente", temps: 3, nbRepetition: 8, chargeKg: 10)

// Abdominaux
var exAbdos = Exercice(imageGifUrl: "", exerciceName: "Crunch", temps: 0, nbRepetition: 30, chargeKg: 0)



//                     Liste Exercice Niveau 2


//                     Liste Exercice Niveau 3





// Phrase de Motivation

var phrases : [String] = ["Concentre toi sur tes objectifs pas sur tes echecs.",
                          "Toute realisation commence par la volonte d'essayer.",
                          "Motivez votre essprit et le corps suivra !",
                          "Les champions s'entrainent, les perdants ce plaignent.",
                          "La douleur est temporaire L'abandon est definitif.",
                          "Ce qui te semble impossible aujourd'hui sera ton échauffement de demain.",
                          "Être en forme n'est pas une mode mais un mode vie."]

struct Video :  Identifiable {
    
    var id = UUID()
    
    //    var thumbnailName: String
    //    var description: String
    var videoName: String
    var videoExtension: String
   
    
    

static var all:[Video] = [
    
    Video(  videoName: "biceps", videoExtension: "mp4"),
    Video( videoName: "dorsaux", videoExtension: "mp4"),
    Video(  videoName: "pecs", videoExtension: "mp4"),
    Video(   videoName: "epaules", videoExtension: "mp4"),
    Video(   videoName: "jambes", videoExtension: "mp4")
]
}
