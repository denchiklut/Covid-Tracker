//
//  CovidModel.swift
//  COVID 19
//
//  Created by Александров Денис Александрович on 8/4/20.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import Foundation

class CovidViewModel: ObservableObject, CovidManagerDelegate {
    let covidManager = CovidManager()
    
    @Published var date: String = ""
    @Published var countries: [CountryData] = [
    CountryData(
        Country: "Старна 1",
        CountryCode: "test",
        Slug: "test",
        NewConfirmed: 344,
        TotalConfirmed: 36747,
        NewDeaths: 347,
        TotalDeaths: 21543,
        NewRecovered: 37,
        TotalRecovered: 4324,
        Date: "12"
    ),
    CountryData(
        Country: "Старна 2",
        CountryCode: "test",
        Slug: "test",
        NewConfirmed: 34,
        TotalConfirmed: 4325,
        NewDeaths: 76,
        TotalDeaths: 3534,
        NewRecovered: 225,
        TotalRecovered: 7568,
        Date: "12"
    ),
    CountryData(
        Country: "Старна 3",
        CountryCode: "test",
        Slug: "test",
        NewConfirmed: 45,
        TotalConfirmed: 23435,
        NewDeaths: 755,
        TotalDeaths: 3453,
        NewRecovered: 25,
        TotalRecovered: 4254,
        Date: "12"
    ),
    CountryData(
        Country: "Старна 4",
        CountryCode: "test",
        Slug: "test",
        NewConfirmed: 3,
        TotalConfirmed: 2425,
        NewDeaths: 25,
        TotalDeaths: 4632,
        NewRecovered: 45,
        TotalRecovered: 3626,
        Date: "12"
    ),
    CountryData(
        Country: "Старна 5",
        CountryCode: "test",
        Slug: "test",
        NewConfirmed: 36,
        TotalConfirmed: 4261,
        NewDeaths: 7,
        TotalDeaths: 4325,
        NewRecovered: 25,
        TotalRecovered: 74774,
        Date: "12"
    ),
    CountryData(
        Country: "Старна 6",
        CountryCode: "test",
        Slug: "test",
        NewConfirmed: 35,
        TotalConfirmed: 2523,
        NewDeaths: 74,
        TotalDeaths: 9669,
        NewRecovered: 63,
        TotalRecovered: 6644,
        Date: "12"
    ),
    CountryData(
        Country: "Старна 7",
        CountryCode: "test",
        Slug: "test",
        NewConfirmed: 83,
        TotalConfirmed: 7438,
        NewDeaths: 6,
        TotalDeaths: 5262,
        NewRecovered: 62,
        TotalRecovered: 53647,
        Date: "12"
    ),
    CountryData(
        Country: "Старна 8",
        CountryCode: "test",
        Slug: "test",
        NewConfirmed: 6,
        TotalConfirmed: 2526,
        NewDeaths: 56,
        TotalDeaths: 526,
        NewRecovered: 43,
        TotalRecovered: 2354,
        Date: "12"
    ),
    CountryData(
        Country: "Старна 9",
        CountryCode: "test",
        Slug: "test",
        NewConfirmed: 2,
        TotalConfirmed: 3466,
        NewDeaths: 42,
        TotalDeaths: 6435,
        NewRecovered: 34,
        TotalRecovered: 6436,
        Date: "12"
    ),
    CountryData(
        Country: "Старна 10",
        CountryCode: "test",
        Slug: "test",
        NewConfirmed: 6,
        TotalConfirmed: 2342,
        NewDeaths: 24,
        TotalDeaths: 2442,
        NewRecovered: 44,
        TotalRecovered: 3245,
        Date: "12"
    ),
    CountryData(
        Country: "Старна 11",
        CountryCode: "test",
        Slug: "test",
        NewConfirmed: 3,
        TotalConfirmed: 34342,
        NewDeaths: 4773,
        TotalDeaths: 25,
        NewRecovered: 5363,
        TotalRecovered: 22,
        Date: "12"
    ),
    CountryData(
        Country: "Старна 12",
        CountryCode: "test",
        Slug: "test",
        NewConfirmed: 25,
        TotalConfirmed: 5342,
        NewDeaths: 1244,
        TotalDeaths: 35,
        NewRecovered: 4235,
        TotalRecovered: 42,
        Date: "12"
    ),
 ]
    
    @Published var global: Global = Global(
        NewConfirmed: 999,
        TotalConfirmed: 999999,
        NewDeaths: 999,
        TotalDeaths: 999999,
        NewRecovered: 999,
        TotalRecovered: 999999
    )

    init(date: String, countries: [CountryData], global: Global) {
        self.date = date
        self.countries = countries
        self.global = global
        
        covidManager.delegate = self
    }
    
    init() {
        covidManager.delegate = self
    }
    
    func getCovidData() {
        covidManager.fetchData()
    }
    
    func didFailWithError(_ covidManager: CovidManager, error: Error) {
        print(error)
    }
    
    func didUpdateData(_ covidManager: CovidManager, covid: CovidViewModel) {
        DispatchQueue.main.async {
            self.global = covid.global
            self.countries = covid.countries
        }
    }
}

extension CovidViewModel {
    enum Cases: String, CaseIterable {
        case totalCases = "Total cases"
        case totalRecovered = "Total recovered"
        case totalDeaths = "Total deaths"
    }
}
