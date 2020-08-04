//
//  ContentView.swift
//  COVID 19
//
//  Created by Александров Денис Александрович on 8/4/20.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let covidManager = CovidManager()
    
    var body: some View {
        HomeView(covidManager: covidManager)
//        NavigationView {
//            .navigationBarTitle("COVID-19")
//        }
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
