//
//  CovidTableView.swift
//  COVID 19
//
//  Created by Александров Денис Александрович on 8/5/20.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import SwiftUI

struct CovidTableView: View {
    var countries: [CountryData] = []
    @State var category: CovidViewModel.Cases = .totalCases
    
    var body: some View {
        VStack(spacing: 20) {
           Picker("Category", selection: $category.caseIndex) {
                ForEach(CovidViewModel.Cases.allCases.indices) { categoryIndex in
                    Text(CovidViewModel.Cases.allCases[categoryIndex].rawValue)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            ForEach(countries.indices) { index in
                VStack {
                    HStack {
                        Text(String(index + 1))
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.gray)
                        Text(self.countries[index].Country)
                        Spacer()
                        HStack() {
                            if self.getValue(for: index).new != "0" {
                                Text("+ \(self.getValue(for: index).new)")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.orange)
                            }
                      
                            Text(self.getValue(for: index).current)
                        }
                    }
                    Divider()
                }
                .listStyle(GroupedListStyle())
            }
        }
        .padding(.all)
    }
    
    func getValue(for index: Int) -> (new: String, current: String) {
        switch category {
            case .totalCases: return (new: String(countries[index].NewConfirmed), current: String(countries[index].TotalConfirmed))
            case .totalRecovered: return (new: String(countries[index].NewRecovered), current: String(countries[index].TotalRecovered))
            case .totalDeaths: return (new: String(countries[index].NewDeaths), current: String(countries[index].TotalDeaths))
        }
    }
}

struct CovidTableView_Previews: PreviewProvider {
    static var previews: some View {
        CovidTableView(countries: [
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
            ),
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
            )])
    }
}
