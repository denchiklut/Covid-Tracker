//
//  ContentView.swift
//  COVID 19
//
//  Created by Александров Денис Александрович on 8/4/20.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let covidViewModel = CovidViewModel()
    
    var body: some View {
        HomeView()
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
