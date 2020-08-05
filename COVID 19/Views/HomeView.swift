//
//  HomeView.swift
//  COVID 19
//
//  Created by Александров Денис Александрович on 8/4/20.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var covidVM = CovidViewModel()
    @State var query = ""
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            HeaderView()
            
            VStack {
                Group {
                    HStack {
                        Image(systemName: "magnifyingglass").foregroundColor(.secondary)
                            .padding([.leading, .vertical])
                        TextField("Username", text: $query)
                   
                    }
                    .background(Capsule().fill(Color("Background")))
                    .padding()
                }.background(Color("GroupFill"))
                
                
                Group {
                    TotalView(
                        totalConfirmed: "\(covidVM.global.TotalConfirmed)",
                        totalDeaths: "\(covidVM.global.TotalDeaths)",
                        totalRecovered: "\(covidVM.global.TotalRecovered)"
                    )
                    
                }.background(Color("GroupFill"))
                
                Group {
                    CovidTableView(countries: covidVM.countries)
                }.background(Color("GroupFill"))
                
            }
        }
        .background(Color("Background"))
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            //            self.covidVM.getCovidData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
