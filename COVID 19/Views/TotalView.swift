//
//  TotalView.swift
//  COVID 19
//
//  Created by Александров Денис Александрович on 8/4/20.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import SwiftUI

struct TotalView: View {
    let totalConfirmed: String
    let totalDeaths: String
    let totalRecovered: String
    
    struct samllText: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(.system(size: 14, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 8)
        }
    }
    
    struct largeText: ViewModifier {
           func body(content: Content) -> some View {
               return content
                .font(.system(size: 20, weight: .bold))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
           }
       }
    
    var body: some View {
        VStack {
            Text("Весь мир")
                .padding(.bottom, 14)
                .font(.system(size: 20, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                VStack {
                    Text("Заболело")
                        .modifier(samllText())
                    Text(totalConfirmed)
                        .modifier(largeText())
                }
                Spacer()
                Divider().frame(height: 40)
                Spacer()
                VStack {
                    Text("Выздоровело")
                        .modifier(samllText())
                    Text(totalRecovered)
                        .modifier(largeText())
                }
                Spacer()
                Divider().frame(height: 40)
                Spacer()
                VStack {
                    Text("Умерло")
                        .modifier(samllText())
                    Text(totalDeaths)
                        .modifier(largeText())
                }
            }
        }
        .padding()
    }
}

struct TotalView_Previews: PreviewProvider {
    static var previews: some View {
        TotalView(totalConfirmed: "18 196 221", totalDeaths: "10 852 611", totalRecovered: "691 740")
    }
}
