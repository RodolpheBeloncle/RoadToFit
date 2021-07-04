//
//  ViewModel.swift
//  RoadToFit
//
//  Created by Rodolphe Beloncle on 26/06/2021.
//

import SwiftUI
struct SeanceModel :Identifiable
{
    
    
    var id = UUID()
    let name:String
    let image:String
    let destination:AnyView
    
    
    init(destination: AnyView, image:String, name:String) {
        self.id = UUID()
        self.destination = destination
        self.image = image
        self.name = name
    }
    
}

class SeanceViewModel : ObservableObject{
    /*same @Published = @State but it's in class*/
    @Published var tableauSeances:[SeanceModel] = []
    @Published var tableau2Seance:[SeanceModel] = []
    @Published var isLoading:Bool = false
    
    init(){
        getSeanceSemaine1()
        getSeancesSemaine2()
    }
    
    
    func getSeanceSemaine1(){
        let seance1 = SeanceModel(destination: AnyView(SeanceView(seance: exerciceList1, seance2: exerciceList4)), image: "ExCompletView", name: "Séance Complète")
        
        let seance2 = SeanceModel(destination: AnyView(SeanceDosView( seance: exerciceList3)), image: "seanceDos", name: "Séance Dos")
        
        let seance3 = SeanceModel(destination: AnyView(SeanceHautDuCorpsView(seance:exerciceList2)) , image: "seanceHautDuCorps", name: "Séance Haut Du Corps ")
        
        let seance4 = SeanceModel( destination: AnyView(SeanceJambesView( seance: exerciceList4)), image: "seanceJambes", name: "Séance Jambes")
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            
            self.tableauSeances.append(seance1)
            self.tableauSeances.append(seance2)
            self.tableauSeances.append(seance3)
            self.tableauSeances.append(seance4)
            self.isLoading = false
            
        }
        
    }
    func getSeancesSemaine2(){
        
        let seance5 = SeanceModel(destination: AnyView(SeanceView( seance: exerciceList1, seance2: exerciceList4)), image: "ExCompletView", name: "Séance Complète")
        let seance6 = SeanceModel(destination: AnyView(SeanceHautDuCorpsView(seance: exerciceList2)), image: "seanceHautDuCorps", name: "Séance Haut Du Corps")
        let seance7 = SeanceModel(destination: AnyView(SeanceDosView(seance: exerciceList3)) , image: "seanceDos", name: "Séance Dos ")
        let seance8 = SeanceModel( destination: AnyView(SeanceJambesView(seance: exerciceList4)), image: "seanceJambes", name: "Séance Jambes ")
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            
            self.tableau2Seance.append(seance5)
            self.tableau2Seance.append(seance6)
            self.tableau2Seance.append(seance7)
            self.tableau2Seance.append(seance8)
            self.isLoading = false
            
        }
        
    }
    
    
    func deleteSeance(index: IndexSet){
        tableauSeances.remove(atOffsets: index)
        
    }
    
    func move(indices:IndexSet,newOffset:Int){
        tableauSeances.move(fromOffsets: indices, toOffset: newOffset)
    }
    func add(){
        let seance6 = SeanceModel(destination: AnyView(SeanceView(seance: exerciceList1, seance2: exerciceList4)), image: "ExCompletView", name: "Séance Complète")
        self.tableauSeances.insert(seance6, at: 0)
        
    }
    
}



struct ViewModel: View {
    
    // @StateObject -> USE THIS ON CREATION / INIT
    // @ObservedObject -> USE THIS FOR SUBVIEWS
    
    @StateObject var seanceViewModel: SeanceViewModel = SeanceViewModel()
    @State var isSelected:Bool = false
    
    
    
    var body: some View {
        NavigationView{
            
            List{
                
                
                Section(
                    header: Text("Semaine 1".capitalized)){
                    if seanceViewModel.isLoading{
                        ProgressView()
                    }else{
                        
                        ForEach(seanceViewModel.tableauSeances){ seance in
                            
                            NavigationLink(
                                destination: seance.destination ,
                                
                                
                                label: {
                                    
                                    HStack{
                                        
                                        Image(seance.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 70, height: 70)
                                            .clipShape(Circle())
                                            .padding()
                                            .shadow(color: .black, radius: 2)
                                            .opacity(isSelected ?  0.5 : 1)
                                        
                                        Text(seance.name)
                                            .frame(maxWidth:.infinity)
                                            .padding()
                                                .background(Color.orange)
                                            .cornerRadius(10)
                                    }
                                    .foregroundColor(.white)
                                    
                                    
                                })
                        }
                        .onDelete(perform: seanceViewModel.deleteSeance)
                        .onMove(perform: seanceViewModel.move)
                        .listRowBackground(Color.white)
 
                    }
                    
                }
                
                Section(header:Text("Semaine 2".capitalized)){
                    if seanceViewModel.isLoading{
                        ProgressView()
                    }else{
                        ForEach(seanceViewModel.tableau2Seance){seance in
                            NavigationLink(
                                destination: seance.destination ,
                                
                                
                                label: {
                                    
                                    HStack{
                                        
                                        Image(seance.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 70, height: 100)
                                            .clipShape(Circle())
                                            .padding()
                                            .shadow(color: .white, radius: 10)
                                            .opacity(isSelected ?  0.5 : 1)
                                        
                                        Text(seance.name)
                                            .frame(maxWidth:.infinity)
                                            .padding()
                                                .background(Color.orange)
                                            .cornerRadius(10)
    
                                    }
                                    
                                    .foregroundColor(.white)
                                    
                                    
                                    
                                })
                            
                            
                        }
                        
                        .onDelete(perform: seanceViewModel.deleteSeance)
                        .onMove(perform: seanceViewModel.move)
                        .listRowBackground(Color.white)
                        
                        
                    }
                }
            }
            //.accentColor(.blue)
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Objectif / Semaine")
            .navigationBarItems(
                leading:  EditButton(),
                trailing:
                    Button("Ajouter Séance",action:{
                        seanceViewModel.add()
                    }))
            
            
            
            
        }
        .accentColor(.orange)
        
        
        
    }
    
    
    
    
}






struct SeanceComplete: View {
    
    
    var body: some View{
        NavigationLink(
            destination: SeanceView(seance: exerciceList1, seance2: exerciceList4),
            label: {
                
                VStack{
                    Image("ExCompletView")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    Text("Séance Complète")
                }
            })
        
    }
    
}

struct ViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ViewModel()
    }
}

