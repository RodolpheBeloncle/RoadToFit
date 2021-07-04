//
//  TabView.swift
//  RoadToFit
//
//  Created by Nkindanda on 22/06/2021.
//

import SwiftUI

struct BarNavView: View {
    init() {
        
           UITabBar.appearance().barTintColor = UIColor.orange
       }
    var body: some View {
     
       
      
            TabView{
                ViewModel()
                        .tabItem {
                            Image(systemName: "calendar")
                            Text("Objectifs")
                            
                            
                            
                        }
                    ProfilView()
                        .tabItem {
                            Image(systemName: "person.fill.checkmark")
                            Text("Profil")
                            
                            
                        }
                    
            }
           
        
        
    }
    

}

struct BarNavView_Previews: PreviewProvider {
    static var previews: some View {
        BarNavView()
    }
}
