//
//  CovidManager.swift
//  COVID 19
//
//  Created by Александров Денис Александрович on 8/4/20.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import Foundation

protocol CovidManagerDelegate {
    func didUpdateData(_ covidManager: CovidManager, covid: CovidViewModel)
    func didFailWithError(_ covidManager: CovidManager, error: Error)
}

class CovidManager {
    let apiURL = "https://api.covid19api.com/summary"
    var delegate: CovidManagerDelegate?
    
    func performRequest(with url: String) {
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(self, error: error!)
                    return
                } else {
                    if let data = data {
                        if let covid = self.parceJSON(data) {
                            self.delegate?.didUpdateData(self, covid: covid)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parceJSON(_ covidData: Data) -> CovidViewModel? {
        let decoder = JSONDecoder()
    
        do {
            let decodedData = try decoder.decode(CovidData.self, from: covidData)
            let date = decodedData.Date
            let countries = decodedData.Countries
            let global = decodedData.Global
            
            let covidModel = CovidViewModel(
                date: date,
                countries: countries,
                global: global
            )
            
            return covidModel
        } catch {
            self.delegate?.didFailWithError(self, error: error)
            return nil
        }
    }
    
    func fetchData() {
        performRequest(with: apiURL)
    }
}
