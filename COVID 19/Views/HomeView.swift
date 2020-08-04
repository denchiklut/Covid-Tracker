//
//  HomeView.swift
//  COVID 19
//
//  Created by Александров Денис Александрович on 8/4/20.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import SwiftUI

struct HomeView: View, CovidManagerDelegate {
    @State var global: Global?
    @State var countries: [CountryData] = []
    
    func didFailWithError(_ covidManager: CovidManager, error: Error) {
        print(error)
    }
    
    func didUpdateData(_ covidManager: CovidManager, covid: CovidModel) {
        global = covid.global
        countries = covid.countries
    }
    
    struct equalWidth: ViewModifier {
        let columns: Int
        func body(content: Content) -> some View {
            return content
                .frame(width: (UIScreen.main.bounds.width / CGFloat(columns) - 16), alignment: .trailing)
        }
    }
    
    let covidManager: CovidManager
    
    var body: some View {
        VStack {
            Image("covid map")
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 5)
                .clipped()
            VStack {
                HStack {
                    Text("Covid-19")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {}) {
                        Text("More")
                            .fontWeight(.bold)
                    }
                }
                .padding()
                
                TotalView(
                    totalConfirmed: "\(global?.TotalConfirmed ?? 0 )",
                    totalDeaths: "\(global?.TotalDeaths ?? 0)",
                    totalRecovered: "\(global?.TotalRecovered ?? 0)"
                )
                
                List(countries) { (country: CountryData) in
                    HStack {
                        Text(country.Country)
                        Spacer()
                        HStack {
                            Text("\(country.TotalConfirmed)").frame(width: 80, alignment: .trailing)
                            Text("\(country.TotalRecovered)").frame(width: 80, alignment: .trailing)
                            Text("\(country.TotalDeaths)").frame(width: 80, alignment: .trailing)
                        }
                    }
                    .listStyle(GroupedListStyle())
                }
            }
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            self.covidManager.delegate = self
            self.covidManager.getData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            global: Global(
                NewConfirmed: 18281475,
                TotalConfirmed: 18281475,
                NewDeaths: 18281475,
                TotalDeaths: 18281475,
                NewRecovered: 18281475,
                TotalRecovered: 18281475
            ),
            countries: [
                CountryData(
                    Country: "Test Test",
                    CountryCode: "test",
                    Slug: "test",
                    NewConfirmed: 36747,
                    TotalConfirmed: 36747,
                    NewDeaths: 36747,
                    TotalDeaths: 36747,
                    NewRecovered: 36747,
                    TotalRecovered: 36747, Date: "12"
                )],
            covidManager: CovidManager())
    }
}


